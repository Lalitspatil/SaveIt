import 'package:saveit/services/api_client.dart';
import 'package:saveit/services/urls.dart';

class InstaServices {
  final apiClient = ApiClient();

  Future<ResultSet?> fetchMedia(String url) async {
    final response = await apiClient.get(
      "${Urls.insta}?url=$url",
    );

    return response;
  }
}