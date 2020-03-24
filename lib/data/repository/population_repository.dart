import 'package:domain/data_repository/population_data_repository.dart';
import 'package:fluttergraphs/data/model/population_data_cm.dart';

class PopulationRepository implements PopulationDataRepository {
  Future<List<PopulationDataCM>> getPopulationDataList() async =>
      _populationDataList;

  final _populationDataList = [
    PopulationDataCM(
      year: 1880,
      population: 50189209,
    ),
    PopulationDataCM(
      year: 1890,
      population: 62979766,
    ),
    PopulationDataCM(
      year: 1900,
      population: 76212168,
    ),
    PopulationDataCM(
      year: 1910,
      population: 92228496,
    ),
    PopulationDataCM(
      year: 1920,
      population: 106021537,
    ),
    PopulationDataCM(
      year: 1930,
      population: 123202624,
    ),
    PopulationDataCM(
      year: 1940,
      population: 132164569,
    ),
    PopulationDataCM(
      year: 1950,
      population: 151325798,
    ),
    PopulationDataCM(
      year: 1960,
      population: 179323175,
    ),
    PopulationDataCM(
      year: 1970,
      population: 203302031,
    ),
    PopulationDataCM(
      year: 1980,
      population: 226542199,
    ),
    PopulationDataCM(
      year: 1990,
      population: 248709873,
    ),
    PopulationDataCM(
      year: 2000,
      population: 281421906,
    ),
    PopulationDataCM(
      year: 2010,
      population: 307745538,
    ),
    PopulationDataCM(
      year: 2017,
      population: 323148586,
    ),
  ];
}
