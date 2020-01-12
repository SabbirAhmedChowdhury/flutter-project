import 'package:flutter/foundation.dart';

class Transacion {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transacion({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
