import 'package:flutter/widgets.dart';

class SalesData {
  SalesData({
    @required this.year,
    @required this.sales,
  })  : assert(year != null),
        assert(sales != null);

  final int year;
  final int sales;
}
