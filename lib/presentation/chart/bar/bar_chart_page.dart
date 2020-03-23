import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_population_data_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/bar/bar_chart_bloc.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Population of U.S. over the years",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: bloc.onNewState,
                    builder: (context, snapshot) => snapshot.data != null
                        ? charts.BarChart(
                            snapshot.data,
                            animate: true,
                            animationDuration: Duration(seconds: 3),
                            domainAxis: charts.OrdinalAxisSpec(
                              renderSpec: charts.SmallTickRendererSpec(
                                labelRotation: 60,
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
