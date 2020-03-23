import 'package:domain/data_repository/grades_data_repository.dart';
import 'package:domain/models/grades_data.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:flutter/widgets.dart';

class GetGradesDataUC extends UseCase<void, List<GradesData>> {
  GetGradesDataUC({
    @required this.repository,
  }) : assert(repository != null);

  final GradesDataRepository repository;

  @override
  Future<List<GradesData>> getRawFuture({void params}) =>
      repository.getGradesDataList();
}
