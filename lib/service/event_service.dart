import '../model/event_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EventService {
  static Future<List<EventModel>> fetchEvents() async {
    var response = await http.get(Uri.parse("http://cnc.cs.sci.ku.ac.th:8000/api/todos"));
    if (response.statusCode == 200) {
       List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) =>  EventModel.fromJson(data)).toList();
    } else {
      throw Exception('Error');
    }
  }
}