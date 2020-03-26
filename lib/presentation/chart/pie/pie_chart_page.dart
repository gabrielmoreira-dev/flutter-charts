import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_grades_data_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/chart_card.dart';
import 'package:fluttergraphs/presentation/chart/pie/pie_chart_bloc.dart';
import 'package:fluttergraphs/presentation/common/graphs_app_bar.dart';
import 'package:fluttergraphs/presentation/common/response_view/response_view.dart';
import 'package:provider/provider.dart';

import 'pie_chart_models.dart';

class PieChartPage extends StatelessWidget {
  PieChartPage({
    @required this.bloc,
  }) : assert(bloc != null);

  final PieChartBloc bloc;

  static Widget create(BuildContext context) =>
      ProxyProvider<GetGradesDataUC, PieChartBloc>(
        update: (_, uc, currentBloc) =>
            currentBloc ??
            PieChartBloc(
              gradesDataUC: uc,
            ),
        child: Consumer<PieChartBloc>(
          builder: (_, bloc, __) => PieChartPage(
            bloc: bloc,
          ),
        ),
      );

  Widget _chartBuilder(List<charts.Series<GradesDataVM, String>> data) =>
      charts.PieChart(
        data,
        animate: true,
        animationDuration: const Duration(seconds: 3),
        defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 50,
          arcRendererDecorators: [
            charts.ArcLabelDecorator(
              outsideLabelStyleSpec: charts.TextStyleSpec(
                color: charts.Color.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GraphsAppBar(
        title: 'Pie Chart',
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder(
        stream: bloc.onNewState,
        builder: (context, snapshot) => ResponseView<Loading, Error, Success>(
          snapshot: snapshot,
          builder: (context, success) => ChartCard(
            chartBuilder: _chartBuilder(success.series),
            title: "Grades",
          ),
        ),
      ),
    );
  }
}
