import 'package:calendar/model/event_model.dart';
import 'package:calendar/page/testNavigatorPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar/service/event_service.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late EventModel temp;
  late Future<List<EventModel>> futureEvent;
  late Map<DateTime, List<EventModel>> _events;
  late Map<DateTime, List<EventModel>> _selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureEvent = EventService.fetchEvents();
    _events = {};
  }

  String formatDateTime(String dateTime) {
    return DateFormat("yyyy-MM-DD").format(DateTime.parse(dateTime));
  }

  List<EventModel> _getEventForDay(DateTime day) {
    return _events[day]??[];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CNC Calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder <List<EventModel>>(
            future: EventService.fetchEvents(),
            builder: (_,snapshot){ 
              return
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },

                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                  for(int i = 0; i < snapshot.data!.length; i++) {
                    if(formatDateTime(snapshot.data![i].deadLine) == selectDay.toString()) {
                      temp = snapshot.data![i];
                    }
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) => testNavigatorPagge(testEvent: temp,),));
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                
                calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}