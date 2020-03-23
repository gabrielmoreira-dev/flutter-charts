import 'package:domain/data_repository/population_data_repository.dart';
import 'package:domain/models/population_data.dart';

class PopulationRepository implements PopulationDataRepository {
  Future<List<PopulationData>> getPopulationDataList() async =>
      _populationDataList;

  List<PopulationData> _populationDataList = [
    PopulationData(
      year: 1880,
      population: 50189209,
    ),
    PopulationData(
      year: 1890,
      population: 62979766,
    ),
    PopulationData(
      year: 1900,
      population: 76212168,
    ),
    PopulationData(
      year: 1910,
      population: 92228496,
    ),
    PopulationData(
      year: 1920,
      population: 106021537,
    ),
    PopulationData(
      year: 1930,
      population: 123202624,
    ),
    PopulationData(
      year: 1940,
      population: 132164569,
    ),
    PopulationData(
      year: 1950,
      population: 151325798,
    ),
    PopulationData(
      year: 1960,
      population: 179323175,
    ),
    PopulationData(
      year: 1970,
      population: 203302031,
    ),
    PopulationData(
      year: 1980,
      population: 226542199,
    ),
    PopulationData(
      year: 1990,
      population: 248709873,
    ),
    PopulationData(
      year: 2000,
      population: 281421906,
    ),
    PopulationData(
      year: 2010,
      population: 307745538,
    ),
    PopulationData(
      year: 2017,
      population: 323148586,
    ),
  ];
}
