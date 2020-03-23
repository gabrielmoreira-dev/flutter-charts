import 'package:flutter/widgets.dart';

class PopulationData {
  PopulationData({
    @required this.year,
    @required this.population,
  })  : assert(year != null),
        assert(population != null);

  final int year;
  final int population;
}
