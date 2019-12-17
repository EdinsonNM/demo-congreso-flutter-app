import 'dart:async';
import 'dart:convert';
import 'package:congreso_incca/src/models/comite.dart';
import 'package:http/http.dart' as http;
import 'package:congreso_incca/src/constants/routes/routes-service.dart';

class ComiteProvider{

  static Future<List<Comite>> getAll() async {
      var response = await http.get(RouteService.comites);
      if (response.statusCode == 200) {
        List<Comite> results = ComiteResults.fromJson(json.decode(response.body)).results;
        return results;
      } else {
        throw Exception('Failed to load post');
      }
  }
  
}