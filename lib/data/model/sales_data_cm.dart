import 'package:flutter/widgets.dart';

class SalesDataCM {
  SalesDataCM({
    @required this.year,
    @required this.sales,
  })  : assert(year != null),
        assert(sales != null);

  final int year;
  final int sales;
}