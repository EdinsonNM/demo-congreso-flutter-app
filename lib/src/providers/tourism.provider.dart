import 'dart:async';
import 'dart:convert';
import 'package:congreso_incca/src/models/tourism.dart';
import 'package:http/http.dart' as http;
import 'package:congreso_incca/src/constants/routes/routes-service.dart';

class TourismProvider{

  static Future<List<Tourism>> getAll() async {
      var response = await http.get(RouteService.tourism);
      if (response.statusCode == 200) {
        List<Tourism> results = TourismResults.fromJson(json.decode(response.body)).results;
        return results;
      } else {
        throw Exception('Failed to load tourism');
      }
  }
  
}