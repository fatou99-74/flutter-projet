import 'dart:convert';

import 'package:flutter_meteo_app_projet_dar23/models/meteo_model.dart';
import 'package:flutter_meteo_app_projet_dar23/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<MeteoModel> fetchMeteo(int index) async {
  String city = cities[index];

  try {
    return await http
        .get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'))
        .then((result) {
      if (result.statusCode == 200) {
        return MeteoModel.fromJson(jsonDecode(result.body));
      } else {
        throw 'fetchMeteo => ${result.body}';
      }
    });
  } catch (e) {
    throw 'fetchMeteo => $e';
  }
}
