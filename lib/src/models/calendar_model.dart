import 'package:flutter/material.dart';
 
class Event {
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
 
  Event({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}
 
class EventProvider with ChangeNotifier {
  List<Event> _events = [];
 
  List<Event> get events => _events;
 
  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
 
  void removeEvent(int index) {
    _events.removeAt(index);
    notifyListeners();
  }
}