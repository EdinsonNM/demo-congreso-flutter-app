import 'dart:async';
import 'dart:convert';
import 'package:congreso_incca/src/models/notification.dart';
import 'package:http/http.dart' as http;
import 'package:congreso_incca/src/constants/routes/routes-service.dart';

class NotificationProvider{

  static Future<List<Notification>> getAll() async {
      var response = await http.get(RouteService.notifications);
      if (response.statusCode == 200) {
        List<Notification> results = NotificationResults.fromJson(json.decode(response.body)).results;
        return results;
      } else {
        throw Exception('Failed to load Notifciation');
      }
  }
  
}