import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';

class SalesDataVM {
  SalesDataVM({
    @required this.year,
    @required this.sales,
  })  : assert(year != null),
        assert(sales != null);

  final int year;
  final int sales;
}

abstract class LineChartState {}

class Loading implements LineChartState {}

class Error implements LineChartState {}

class Success implements LineChartState {
  Success({
    @required this.series,
  }) : assert(series != null);

  final List<charts.Series<SalesDataVM, int>> series;
}
