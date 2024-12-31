import 'package:flutter/services.dart';

//this is used to parse the json from asset
class AssetsHelper {
  static Future<String> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonString;
  }
}
