import 'dart:convert';

import 'package:flutter/services.dart';

const appName = 'Paint Wale';
const en = 'en';

Future<Map<String, dynamic>> loadJsonAssets({String? fileName}) async {
  var jsonData = await rootBundle.loadString('assets/json/$en/$fileName.json');
  return jsonDecode(jsonData) as Map<String, dynamic>;
}