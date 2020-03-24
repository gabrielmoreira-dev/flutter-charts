import 'package:fluttergraphs/data/model/population_data_cm.dart';

abstract class PopulationDataRepository {

  Future<List<PopulationDataCM>> getPopulationDataList();

}