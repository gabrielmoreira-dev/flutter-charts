import 'package:meta/meta.dart';

import '../data_repository/population_data_repository.dart';
import '../models/population_data.dart';
import 'use_case.dart';

class GetPopulationDataUC extends UseCase<void, List<PopulationData>> {
  GetPopulationDataUC({
    @required this.repository,
  }) : assert(repository != null);

  final PopulationDataRepository repository;

  @override
  Future<List<PopulationData>> getRawFuture({void params}) =>
      repository.getPopulationDataList();
}
