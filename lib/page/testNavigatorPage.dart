import 'package:calendar/model/event_model.dart';
import 'package:flutter/material.dart';

class testNavigatorPagge extends StatefulWidget {
  testNavigatorPagge({Key? key,required this.testEvent}) : super(key: key);
  final EventModel testEvent;
  @override
  State<testNavigatorPagge> createState() => _testNavigatorPaggeState();
}

class _testNavigatorPaggeState extends State<testNavigatorPagge> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.testEvent.deadLine);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}