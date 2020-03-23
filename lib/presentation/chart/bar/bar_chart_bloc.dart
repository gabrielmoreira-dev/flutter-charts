import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_population_data_uc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttergraphs/presentation/chart/bar/bar_chart_models.dart';
import 'package:rxdart/rxdart.dart';

import 'bar_chart_models.dart';
import 'bar_chart_mappers.dart';

class BarChartBloc {
  BarChartBloc({
    @required this.populationDataUC,
  }) : assert(populationDataUC != null) {
    _subscriptions.add(
      _fetchPopulationData().listen(_onNewStateSubject.add),
    );
  }

  final GetPopulationDataUC populationDataUC;

  final _subscriptions = CompositeSubscription();

  final _onNewStateSubject =
      BehaviorSubject<List<charts.Series<PopulationDataVM, String>>>();

  Stream<List<charts.Series<PopulationDataVM, String>>> get onNewState =>
      _onNewStateSubject;

  Stream<List<charts.Series<PopulationDataVM, String>>>
      _fetchPopulationData() async* {
    try {
      final populationDataList = await populationDataUC.getFuture();
      final dataVM = populationDataList.map((data) => data.toVM()).toList();
      List<charts.Series<PopulationDataVM, String>> series = [
        charts.Series(
          id: 'Population',
          data: dataVM,
          domainFn: (PopulationDataVM series, _) => series.year.toString(),
          measureFn: (PopulationDataVM series, _) => series.population,
          colorFn: (PopulationDataVM series, _) => series.barColor,
        )
      ];
      yield series;
    } catch (e) {
      yield <charts.Series<PopulationDataVM, String>>[];
    }
  }

  void dispose() {
    _onNewStateSubject.close();
  }
}
