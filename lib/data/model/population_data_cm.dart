import 'package:flutter/widgets.dart';

class PopulationDataCM {
  PopulationDataCM({
    @required this.year,
    @required this.population,
  })  : assert(year != null),
        assert(population != null);

  final int year;
  final int population;
}