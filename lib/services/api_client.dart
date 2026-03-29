
  import 'dart:convert';
  import 'dart:io';
  import 'package:http/http.dart' as http;
  import 'package:http_parser/http_parser.dart';
  import 'package:mime/mime.dart';
  import 'package:rxdart/subjects.dart';
  import 'package:services/shared/cache_data.dart';
  import 'package:services/utils/constants.dart';
  import 'package:shared_enums/utils/enums.dart';

  final BehaviorSubject<bool> logoutRx = BehaviorSubject<bool>();
  class ResultSet<T> {
    HttpStatusCode? httpStatusCode;
    String? message;
    int? primaryKey;
    T? data;
    Map<String, dynamic>? adhoc;
    bool? isLogout = false;

    ResultSet({this.httpStatusCode, this.message,this.data, this.primaryKey, this.isLogout = false});
  }

  abstract class NetworkServices {
    bool isOffline = false;
    NetworkServices({this.isOffline = false});
    final apiClient = ApiClient();
  }

  String bASEURL = 'http://127.0.0.1:8000';
  String refreshTokenPath = '/api/token/refresh/';
  String? globalToken;
  String? gloalRefreshToken;
  
  class ApiClient {
    
    Future<ResultSet?> get(String controller) async {
      try {
        String url = '$bASEURL/$controller';
        logD("GET: $url");
        Map<String, String>? headers = {
          'Content-Type': "application/json",
          'Authorization': 'Bearer $globalToken'
        };
        http.Response response = await http.get(Uri.parse(url), headers: headers);
        var result = jsonDecode(response.body);
        logD('Response:\n$result');
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          return ResultSet(data: result, httpStatusCode: HttpStatusCode.success);
        } else {
          if ((result as Map).keys.toList().contains("detail") || (result as Map).keys.toList().contains("error_code")) {
            if (result.keys.toList().contains('code') || result.keys.toList().contains('error_code')) {
              if((result['detail'] != 'Given token not valid for any token type' && result['detail'] != null) || result['error_code'] == 'invalid_session'){
                logoutRx.add(true);
                return ResultSet(
                      message: result['detail'] ?? result['message'], data: {'message': result['detail'] ?? result['message'], 'logout': true},isLogout: true,httpStatusCode: HttpStatusCode.error);
              }
              return await refreshToken(
                  controller: controller, httpMethod: HttpMethod.GET);
            } else {
              return ResultSet(
                  message: result['detail'], httpStatusCode: HttpStatusCode.error);
            }
          }
          return ResultSet(
              message: result['message'], httpStatusCode: HttpStatusCode.error);
        }
      } catch (error) {
        return ResultSet(message: error.toString(), httpStatusCode: HttpStatusCode.error);
      }
    }

    Future<ResultSet?> post(
        String controller, Map<String, dynamic> params,{bool hideAuth = false}) async {
      try {
        String url = '$bASEURL/$controller';
        Map<String, String>? headers = {
          'Content-Type': "application/json",
        };
        if (!hideAuth) {
          headers
              .addAll({'Authorization': 'Bearer $globalToken'});
        }
        String body = jsonEncode(params);
        logD("POST: $url\nBODY: $body");
        http.Response response =
            await http.post(Uri.parse(url), body: body, headers: headers);
        var result = jsonDecode(response.body);
        logD('Response:\n$result');
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          return ResultSet(data: result, httpStatusCode: HttpStatusCode.success);
        } else {
          if ((result as Map).keys.toList().contains("detail") || (result as Map).keys.toList().contains("error_code")) {
            if (result.keys.toList().contains('code') || result.keys.toList().contains('error_code')) {
              if((result['detail'] != 'Given token not valid for any token type' && result['detail'] != null) || result['error_code'] == 'invalid_session'){
                logoutRx.add(true);
                return ResultSet(
                      message: result['detail'] ?? result['message'], data: {'message': result['detail'] ?? result['message'], 'logout': true},isLogout: true,httpStatusCode: HttpStatusCode.error);
              }
              return await refreshToken(
                  controller: controller,
                  params: params,
                  httpMethod: HttpMethod.POST);
            } else {
              return ResultSet(
                  message: result['detail'], httpStatusCode: HttpStatusCode.error);
            }
          }
          return ResultSet(
              message: result['message'], httpStatusCode: HttpStatusCode.error);
        }
      } catch (error) {
        return ResultSet(message: error.toString(), httpStatusCode: HttpStatusCode.error);
      }
    }

    Future<ResultSet?> postUpload(String controller, Map<String, String?> params,
        {Map<String, File?>? files, List<File?>? listFiles, String? fileKey}) async {
      try {
        String url = '$bASEURL/$controller';
        var request =
            http.MultipartRequest(HttpMethod.POST.value, Uri.parse(url));
        for (var element in params.entries) {
          request.fields.addAll({element.key: element.value ?? ''});
        }
        logD("BODY\n${request.fields}");
        request.headers.addAll({
          'Content-Type': "multipart/form-data",
          'Authorization': 'Bearer $globalToken'
        });

        if((files?.isEmpty == true || files == null) && listFiles?.isNotEmpty == true){
          for(File? element in (listFiles ?? [])){
            final mimeTypes = (lookupMimeType(element?.path ?? '') ?? '').split("/");
            MediaType? mediaType;
            if (mimeTypes.length > 1) {
              mediaType = MediaType(mimeTypes[0], mimeTypes[1]);
            } else {
              mediaType = MediaType('image', 'jpeg');
            }
            http.MultipartFile multiPartFile = await http.MultipartFile.fromPath(
                fileKey ?? '', element?.path ?? '',
                contentType: mediaType);
          request.files.add(multiPartFile);
          }
        }else{
          for (var element in (files ?? {}).entries) {
            if(element.value != null){
              final mimeTypes = (lookupMimeType(element.value?.path ?? '') ?? '').split("/");
              MediaType? mediaType;
              if (mimeTypes.length > 1) {
                mediaType = MediaType(mimeTypes[0], mimeTypes[1]);
              } else {
                mediaType = MediaType('image', 'jpeg');
              }
              http.MultipartFile multiPartFile = await http.MultipartFile.fromPath(
                  element.key, element.value?.path ?? '',
                  contentType: mediaType);
              request.files.add(multiPartFile);
            }
          }
        }
        
        http.StreamedResponse streamedResponse = await request.send();
        String responseBody = await streamedResponse.stream.bytesToString();
        var result = jsonDecode(responseBody);
        logD('Response:\n$result');
        if (streamedResponse.statusCode >= 200 &&
            streamedResponse.statusCode <= 299) {
          return ResultSet(data: result, httpStatusCode: HttpStatusCode.success);
        } else {
          if ((result as Map).keys.toList().contains("detail") || (result as Map).keys.toList().contains("error_code")) {
            if (result.keys.toList().contains('code') || result.keys.toList().contains('error_code')) {
              if((result['detail'] != 'Given token not valid for any token type' && result['detail'] != null) || result['error_code'] == 'invalid_session'){
                logoutRx.add(true);
                return ResultSet(
                      message: result['detail'] ?? result['message'], data: {'message': result['detail'] ?? result['message'], 'logout': true},isLogout: true,httpStatusCode: HttpStatusCode.error);
              }
              return await refreshToken(
                  controller: controller,
                  params: params,
                  files: files,
                  listFiles: listFiles,
                  fileKey: fileKey,
                  httpMethod: HttpMethod.POSTFORM);
            } else {
              return ResultSet(
                  message: result['detail'], httpStatusCode: HttpStatusCode.error);
            }
          }
          return ResultSet(
              message: result['message'], httpStatusCode: HttpStatusCode.error);
        }
      } catch (error) {
        return ResultSet(message: error.toString(), httpStatusCode: HttpStatusCode.error);
      }
    }

    Future<ResultSet?> put(String controller, Map<String, dynamic> params) async {
      try {
        String url = '$bASEURL/$controller';
        Map<String, String>? headers = {
          'Content-Type': "application/json",
          'Authorization': 'Bearer $globalToken'
        };
        String body = jsonEncode(params);
        logD("PUT: $url\nBODY: $body");
        http.Response response =
            await http.put(Uri.parse(url), body: body, headers: headers);
        var result = jsonDecode(response.body);
        logD('Response:\n$result');
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          return ResultSet(data: result, httpStatusCode: HttpStatusCode.success);
        } else {
          if ((result as Map).keys.toList().contains("detail") || (result as Map).keys.toList().contains("error_code")) {
            if (result.keys.toList().contains('code') || result.keys.toList().contains('error_code')) {
              if((result['detail'] != 'Given token not valid for any token type' && result['detail'] != null) || result['error_code'] == 'invalid_session'){
                logoutRx.add(true);
                return ResultSet(
                      message: result['detail'] ?? result['message'], data: {'message': result['detail'] ?? result['message'], 'logout': true},isLogout: true,httpStatusCode: HttpStatusCode.error);
              }
              return await refreshToken(
                  controller: controller,
                  params: params,
                  httpMethod: HttpMethod.PUT);
            } else {
              return ResultSet(
                  message: result['detail'], httpStatusCode: HttpStatusCode.error);
            }
          }
          return ResultSet(
              message: result['message'], httpStatusCode: HttpStatusCode.error);
        }
      } catch (error) {
        return ResultSet(message: error.toString(), httpStatusCode: HttpStatusCode.error);
      }
    }

    Future<ResultSet?> delete(String controller, Map<String, dynamic> params) async {
      try {
        String url = '$bASEURL/$controller';
        Map<String, String>? headers = {
          'Content-Type': "application/json",
          'Authorization': 'Bearer $globalToken'
        };
        String body = jsonEncode(params);
        logD("PUT: $url\nBODY: $body");
        http.Response response =
            await http.delete(Uri.parse(url), body: body, headers: headers);
        var result = jsonDecode(response.body);
        logD('Response:\n$result');
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          return ResultSet(data: result, httpStatusCode: HttpStatusCode.success);
        } else {
          if ((result as Map).keys.toList().contains("detail") || (result as Map).keys.toList().contains("error_code")) {
            if (result.keys.toList().contains('code') || result.keys.toList().contains('error_code')) {
              if((result['detail'] != 'Given token not valid for any token type' && result['detail'] != null) || result['error_code'] == 'invalid_session'){
                logoutRx.add(true);
                return ResultSet(
                      message: result['detail'] ?? result['message'], data: {'message': result['detail'] ?? result['message'], 'logout': true},isLogout: true,httpStatusCode: HttpStatusCode.error);
              }
              return await refreshToken(
                  controller: controller,
                  params: params,
                  httpMethod: HttpMethod.DELETE);
            } else {
              return ResultSet(
                  message: result['detail'], httpStatusCode: HttpStatusCode.error);
            }
          }
          return ResultSet(
              message: result['message'], httpStatusCode: HttpStatusCode.error);
        }
      } catch (error) {
        return ResultSet(message: error.toString(), httpStatusCode: HttpStatusCode.error);
      }
    }

    Future<ResultSet?> refreshToken(
        {String? controller,
        Map<String, dynamic>? params,
        Map<String, File?>? files, 
        List<File?>? listFiles, 
        String? fileKey,
        HttpMethod? httpMethod}) async {

      Map<String, dynamic> params = {'refresh': gloalRefreshToken};
      if(gloalRefreshToken == null){
        String? refrreshToken = await CacheData.shared.getRefreshToken();
        params['refresh'] = refrreshToken;
      }
      var result = await post(refreshTokenPath, params,hideAuth: true);
      if(result?.httpStatusCode == HttpStatusCode.error){
        globalToken = null;
        gloalRefreshToken = null;
        await CacheData.shared.removeRefreshToken();
        logoutRx.add(true);
        return ResultSet(message: 'Session got expired',data: result?.data,isLogout: result?.isLogout,httpStatusCode: HttpStatusCode.error); 
      }
      globalToken = (result?.data as Map)['access'];
      gloalRefreshToken = (result?.data as Map)['refresh'];
      await CacheData.shared.saveRefreshToken();
      if (httpMethod == HttpMethod.GET) {
        var result = await get(controller ?? '');
        return result;
      } else if (httpMethod == HttpMethod.POST) {
        var result = await post(controller ?? '', params);
        return result;
      } else if (httpMethod == HttpMethod.POSTFORM) {
        var result = await postUpload(controller ?? '', params as Map<String, String>, files: files);
        return result;
      } else if (httpMethod == HttpMethod.PUT) {
        var result = await put(controller ?? '', params);
        return result;
      } else if (httpMethod == HttpMethod.DELETE) {
        var result = await delete(controller ?? '', params);
        return result;
      }
      return null;
    }
  }