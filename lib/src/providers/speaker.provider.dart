import 'dart:async';
import 'dart:convert';
import 'package:congreso_incca/src/models/speaker.dart';
import 'package:http/http.dart' as http;
import 'package:congreso_incca/src/constants/routes/routes-service.dart';

class SpeakerProvider{

  static Future<List<Speaker>> getAll() async {
      var response = await http.get(RouteService.speakers);
      if (response.statusCode == 200) {
        List<Speaker> results = SpeakerResults.fromJson(json.decode(response.body)).results;
        return results;
      } else {
        throw Exception('Failed to load post');
      }
  }
  static Future<Speaker> get(id) async {
      var response = await http.get(RouteService.speaker(id));
      if (response.statusCode == 200) {
        Speaker speaker = Speaker.fromJson(json.decode(response.body));
        return speaker;
      } else {
        throw Exception('Failed to load post');
      }
  }
  
}