import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:congreso_incca/src/constants/routes/routes-service.dart';
import 'package:congreso_incca/src/models/program.dart';

class ProgramProvider{

  static Future<List<Program>> getAll() async {
      var response = await http.get(RouteService.programs);
      if (response.statusCode == 200) {
        List<Program> results = ProgramsResults.fromJson(json.decode(response.body)).results;
        return results;
      } else {
        throw Exception('Failed to load post');
      }
  }
}