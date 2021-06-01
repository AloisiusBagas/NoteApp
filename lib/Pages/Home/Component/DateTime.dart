import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String date;
  String day;
  String month;
  String clock;
  @override
  void initState() {
    date = DateFormat('dd').format(DateTime.now());
    day = DateFormat('EEE').format(DateTime.now());
    month = DateFormat('MMM, yyyy').format(DateTime.now());
    clock = DateFormat.Hm().format(DateTime.now());
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) => getTime());
    super.initState();
  }

  void getTime() {
    final DateTime now = DateTime.now();
    formatdate(now);
  }

  void formatdate(DateTime now) {
    if (mounted) {
      setState(() {
        date = DateFormat('dd').format(now);
        day = DateFormat('EEE').format(now);
        month = DateFormat('MMM, yyyy').format(now);
        clock = DateFormat.Hm().format(now);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                date,
                style: const TextStyle(
                    fontFamily: 'Montserrat Bold',
                    fontSize: 36,
                    color: Colors.white),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    day,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 13, color: Colors.white),
                  ),
                  Text(
                    month,
                    style: const TextStyle(
                        fontFamily: 'Montserrat Medium',
                        fontSize: 10,
                        color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          Text(
            clock,
            style: const TextStyle(
                fontFamily: 'DS Digital', fontSize: 30, color: Colors.white),
          )
        ],
      ),
    );
  }
}
