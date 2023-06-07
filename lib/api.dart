import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/symptom.dart';

class Api {
  static const String _url = "http://192.168.0.78:8080/api";
/*  final Map<String, String> _headers = {
    'X-API-KEY':  '3cfa26d6-5c52-480b-90ea-7aee7b40a5d6'
  }; */

  static Future<List<Symptom>> getSymptoms() async {
    final response = await http.get(Uri.parse("$_url/symptoms"),
        headers: {'X-API-KEY': '3cfa26d6-5c52-480b-90ea-7aee7b40a5d6'});

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Map<String, dynamic> embedded = data['_embedded'];
      List<dynamic> symptomsList = embedded['symptomsList'];

      return symptomsList.map((item) => Symptom.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load symptoms');
    }
  }
}
