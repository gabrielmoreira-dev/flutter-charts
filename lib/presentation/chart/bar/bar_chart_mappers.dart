import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/models/population_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttergraphs/presentation/chart/bar/bar_chart_models.dart';

extension BarChartMappers on PopulationData {
  PopulationDataVM toVM() => PopulationDataVM(
        year: year,
        population: population,
        barColor: population < 100000000
            ? charts.ColorUtil.fromDartColor(Colors.lightBlueAccent)
            : population < 200000000
                ? charts.ColorUtil.fromDartColor(Colors.blue)
                : population < 300000000
                    ? charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)
                    : charts.ColorUtil.fromDartColor(Colors.deepPurple),
      );
}
