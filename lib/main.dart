import 'package:domain/use_case/get_grades_data_uc.dart';
import 'package:domain/use_case/get_population_data_uc.dart';
import 'package:domain/use_case/get_sales_data_uc.dart';
import 'package:flutter/material.dart';
import 'package:fluttergraphs/data/repository/grades_repository.dart';
import 'package:fluttergraphs/data/repository/population_repository.dart';
import 'package:fluttergraphs/data/repository/sales_repository.dart';
import 'package:fluttergraphs/presentation/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() => runApp(GraphsApp());

class GraphsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._buildRepositoryProviders,
          ..._buildUCProviders,
        ],
        child: MaterialApp(
          theme: ThemeData(
            backgroundColor: Colors.black87,
            primaryColor: Colors.grey,
            primaryColorDark: Colors.black,
            primaryColorLight: Colors.black45,
            accentColor: Colors.blueAccent,
            textTheme: TextTheme(
              title: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              subtitle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          home: HomeScreen(),
        ),
      );

  final List<SingleChildWidget> _buildRepositoryProviders = [
    Provider(
      create: (_) => PopulationRepository(),
    ),
    Provider(
      create: (_) => SalesRepository(),
    ),
    Provider(
      create: (_) => GradesRepository(),
    ),
  ];

  final List<SingleChildWidget> _buildUCProviders = [
    ProxyProvider<PopulationRepository, GetPopulationDataUC>(
      update: (_, repository, __) => GetPopulationDataUC(
        repository: repository,
      ),
    ),
    ProxyProvider<SalesRepository, GetSalesDataUC>(
      update: (_, repository, __) => GetSalesDataUC(
        repository: repository,
      ),
    ),
    ProxyProvider<GradesRepository, GetGradesDataUC>(
      update: (_, repository, __) => GetGradesDataUC(
        repository: repository,
      ),
    ),
  ];
}
