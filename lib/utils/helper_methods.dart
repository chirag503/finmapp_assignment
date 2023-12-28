import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_app/home/model/about_loan_model.dart';

class HelperMethods {
  // Load JSON data from the asset file
  Future<String> _loadJsonFile() async {
    return await rootBundle.loadString('assets/questions.json');
  }

  // Parse JSON data into QuestionModel
  Future<QuestionModel> parseJson() async {
    String jsonString = await _loadJsonFile();
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return QuestionModel.fromJson(jsonMap);
  }
}
