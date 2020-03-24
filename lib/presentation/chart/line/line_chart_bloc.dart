import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/data/repository/sales_repository.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/use_case/get_sales_data_uc.dart';

import 'line_chart_mappers.dart';

class LineChartBloc {
  LineChartBloc({
    @required this.salesDataUC,
  }) : assert(salesDataUC != null) {
    _subscriptions.add(
      _fetchSalesData().listen(_onNewStateSubject.add),
    );
  }

  final GetSalesDataUC salesDataUC;

  final _subscriptions = CompositeSubscription();

  final _onNewStateSubject = BehaviorSubject<LineChartState>();

  Stream<LineChartState> get onNewState => _onNewStateSubject;

  Stream<LineChartState> _fetchSalesData() async* {
    yield Loading();

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
      yield Success(
        series: series,
      );
    } catch (e) {
      yield Error();
    }
  }

  void dispose() {
    _onNewStateSubject.close();
  }
}
