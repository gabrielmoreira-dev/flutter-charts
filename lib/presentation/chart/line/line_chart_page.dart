import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_sales_data_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/chart_card.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_bloc.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_models.dart';
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
        animationDuration: Duration(seconds: 3),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
      ),
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
