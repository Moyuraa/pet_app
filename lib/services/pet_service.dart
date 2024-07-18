import 'package:final_project/models/pet_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const BASE_URL = 'assets/json/pets.json';

class PetService {
  static Future<List<PetsModel>> getPets() async {
    try {
      final String response = await rootBundle.loadString(BASE_URL);
      return compute(petsModelFromJson, response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
