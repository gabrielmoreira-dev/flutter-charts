import '../models/population_data.dart';

abstract class PopulationDataRepository {

  Future<List<PopulationData>> getPopulationDataList();

}