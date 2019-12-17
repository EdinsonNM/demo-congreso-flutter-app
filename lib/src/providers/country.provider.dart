import 'dart:async';
import 'dart:convert';
import 'package:congreso_incca/src/models/country.dart';
import 'package:http/http.dart' as http;
import 'package:congreso_incca/src/constants/routes/routes-service.dart';

class CountryProvider{

  static Future<List<Country>> getAll() async {
      var response = await http.get(RouteService.countries);
      if (response.statusCode == 200) {
        List<Country> results = CountryResults.fromJson(json.decode(response.body)).results;
        return results;
      } else {
        throw Exception('Failed to load post');
      }
  }
  
}