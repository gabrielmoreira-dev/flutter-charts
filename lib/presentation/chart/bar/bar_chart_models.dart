import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopulationDataVM {
  PopulationDataVM({
    @required this.year,
    @required this.population,
    @required this.barColor,
  })  : assert(year != null),
        assert(population != null),
        assert(barColor != null);

  final int year;
  final int population;
  final charts.Color barColor;
}

abstract class BarChartState {}

class Loading implements BarChartState {}

class Error implements BarChartState {}

class Success implements BarChartState {
  Success({
    @required this.series,
  }) : assert(series != null);

  final List<charts.Series<PopulationDataVM, String>> series;
}
