import 'package:flutter/material.dart';

class DailyHistory {
  final DateTime date;
  final TimeOfDay time;
  final int count;

  DailyHistory(this.count, {required this.date, required this.time});
}