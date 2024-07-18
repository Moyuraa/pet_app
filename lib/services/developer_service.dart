import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:final_project/models/developer_model.dart';

const BASE_URL = 'assets/json/developers.json';

class DeveloperService {
  static Future<List<DevelopersModel>> getDevelopers() async {
    try {
      final String response = await rootBundle.loadString(BASE_URL);
      return compute(developersModelFromJson, response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
