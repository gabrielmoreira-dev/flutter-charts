import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fluttergraphs/data/repository/sales_repository.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/use_case/get_sales_data_uc.dart';

import 'line_chart_mappers.dart';

class LineChartBloc {
  LineChartBloc() {
    _subscriptions.add(
      _fetchSalesData().listen(_onNewStateSubject.add),
    );
  }

  final salesDataUC = GetSalesDataUC(
    repository: SalesRepository(),
  );

  final _subscriptions = CompositeSubscription();

  final _onNewStateSubject =
      BehaviorSubject<List<charts.Series<SalesDataVM, int>>>();

  Stream<List<charts.Series<SalesDataVM, int>>> get onNewState =>
      _onNewStateSubject;

  Stream<List<charts.Series<SalesDataVM, int>>> _fetchSalesData() async* {
    try {
      final salesDataList = await salesDataUC.getFuture();
      final dataVM = salesDataList.map((data) => data.toVM()).toList();
      List<charts.Series<SalesDataVM, int>> series = [
        charts.Series(
          id: 'Sales',
          data: dataVM,
          domainFn: (SalesDataVM series, _) => series.year,
          measureFn: (SalesDataVM series, _) => series.sales,
          colorFn: (SalesDataVM series, _) =>
              charts.MaterialPalette.blue.shadeDefault,
        )
      ];
      yield series;
    } catch (e) {
      yield <charts.Series<SalesDataVM, int>>[];
    }
  }

  void dispose() {
    _onNewStateSubject.close();
  }
}
