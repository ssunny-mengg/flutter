import 'package:calendar/model/event_model.dart';
import 'package:flutter/material.dart';

class testNavigatorPagge extends StatefulWidget {
  testNavigatorPagge({Key? key, required this.listEvent}) : super(key: key);
  final List<EventModel> listEvent;
  @override
  State<testNavigatorPagge> createState() => _testNavigatorPaggeState();
}

class _testNavigatorPaggeState extends State<testNavigatorPagge> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.listEvent
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e.detail),
              ),
            )
            .toList(),
      ),
    ));
  }
}
