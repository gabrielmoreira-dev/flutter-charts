import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_population_data_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/bar/bar_chart_bloc.dart';
import 'package:fluttergraphs/presentation/chart/chart_card.dart';
import 'package:fluttergraphs/presentation/common/graphs_app_bar.dart';
import 'package:fluttergraphs/presentation/common/response_view/response_view.dart';
import 'package:provider/provider.dart';

import 'bar_chart_models.dart';

class BarChartPage extends StatelessWidget {
  BarChartPage({
    @required this.bloc,
  }) : assert(bloc != null);

  final BarChartBloc bloc;

  static Widget create(BuildContext context) =>
      ProxyProvider<GetPopulationDataUC, BarChartBloc>(
        update: (_, uc, currentBloc) =>
            currentBloc ??
            BarChartBloc(
              populationDataUC: uc,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<BarChartBloc>(
          builder: (_, bloc, __) => BarChartPage(
            bloc: bloc,
          ),
        ),
      );

  Widget _chartBuilder(List<charts.Series<PopulationDataVM, String>> data) =>
      charts.BarChart(
        data,
        animate: true,
        animationDuration: const Duration(seconds: 3),
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 60,
            labelStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.white,
            ),
          ),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
            labelStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.white,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GraphsAppBar(
        title: 'Bar Chart',
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
