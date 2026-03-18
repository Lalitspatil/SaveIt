
import 'package:flutter/material.dart';
import 'package:saveit/resources/constants.dart';

class BaseModel with ChangeNotifier{
  Map<String, dynamic> jsonData = {};

  Future<void> init(String filename) async {
    jsonData = await loadJsonAssets(fileName: filename);
    notifyListeners();
  }

  String getValue(String key){
    return jsonData[key] ?? '';
  }

}