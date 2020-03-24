import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';

class GradesDataVM {
  GradesDataVM({
    @required this.gradeSymbol,
    @required this.numberOfStudents,
  })  : assert(gradeSymbol != null),
        assert(numberOfStudents != null);

  final String gradeSymbol;
  final int numberOfStudents;
}

abstract class PieChartState {}

class Loading implements PieChartState {}

class Error implements PieChartState {}

class Success implements PieChartState {
  Success({
    @required this.series,
  }) : assert(series != null);

  final List<charts.Series<GradesDataVM, String>> series;
}