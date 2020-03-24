import 'package:domain/models/grades_data.dart';
import 'package:domain/models/population_data.dart';
import 'package:domain/models/sales_data.dart';
import 'package:fluttergraphs/data/model/grades_data_cm.dart';
import 'package:fluttergraphs/data/model/population_data_cm.dart';
import 'package:fluttergraphs/data/model/sales_data_cm.dart';

extension GradesDataCMMapper on GradesDataCM {
  GradesData toDM() => GradesData(
        gradeSymbol: gradeSymbol,
        numberOfStudents: numberOfStudents,
      );
}

extension PopulationDataCMMapper on PopulationDataCM {
  PopulationData toDM() => PopulationData(
        year: year,
        population: population,
      );
}

extension SalesDataCMMapper on SalesDataCM {
  SalesData toDM() => SalesData(
        year: year,
        sales: sales,
      );
}
