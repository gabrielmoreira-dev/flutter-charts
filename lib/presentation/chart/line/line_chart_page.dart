import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_sales_data_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/chart_card.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_bloc.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_models.dart';
import 'package:fluttergraphs/presentation/common/graphs_app_bar.dart';
import 'package:fluttergraphs/presentation/common/response_view/response_view.dart';
import 'package:provider/provider.dart';

class LineChartPage extends StatelessWidget {
  LineChartPage({
    @required this.bloc,
  }) : assert(bloc != null);

  final LineChartBloc bloc;

  static Widget create(BuildContext context) =>
      ProxyProvider<GetSalesDataUC, LineChartBloc>(
        update: (_, uc, currentBloc) =>
            currentBloc ??
            LineChartBloc(
              salesDataUC: uc,
            ),
        child: Consumer<LineChartBloc>(
          builder: (_, bloc, __) => LineChartPage(
            bloc: bloc,
          ),
        ),
      );

  Widget _chartBuilder(List<charts.Series<SalesDataVM, int>> data) =>
      charts.LineChart(
        data,
        animate: true,
        animationDuration: const Duration(seconds: 3),
        domainAxis: charts.NumericAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.white,
            ),
            
          ),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
        behaviors: [
          charts.SeriesLegend(
            position: charts.BehaviorPosition.bottom,
            cellPadding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            outsideJustification: charts.OutsideJustification.start,
            desiredMaxColumns: 1,
            entryTextStyle: charts.TextStyleSpec(
              color: charts.Color.white,
            ),
          ),
        ],
        defaultRenderer: charts.LineRendererConfig(
          symbolRenderer: charts.CircleSymbolRenderer(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GraphsAppBar(
        title: 'Line Chart',
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder(
        stream: bloc.onNewState,
        builder: (context, snapshot) => ResponseView<Loading, Error, Success>(
          snapshot: snapshot,
          builder: (context, success) => ChartCard(
            chartBuilder: _chartBuilder(success.series),
          ),
        ),
      ),
    );
  }
}
