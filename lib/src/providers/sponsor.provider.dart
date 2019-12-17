import 'dart:async';
import 'dart:convert';
import 'package:congreso_incca/src/models/sponsor.dart';
import 'package:http/http.dart' as http;
import 'package:congreso_incca/src/constants/routes/routes-service.dart';

class SponsorProvider{

  static Future<List<Sponsor>> getAll() async {
      var response = await http.get(RouteService.sponsors);
      if (response.statusCode == 200) {
        Iterable data = json.decode(response.body);
        List<Sponsor> results = SponsorsResults.fromJson(data).results;
        return results;
      } else {
        throw Exception('Failed to load post');
      }
  }
  static Future<Sponsor> get(int id) async {
      var response = await http.get(RouteService.sponsors + '/' + id.toString());
      if (response.statusCode == 200) {
        return Sponsor.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load post');
      }
  }
}