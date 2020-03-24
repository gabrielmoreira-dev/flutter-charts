import 'package:domain/data_repository/sales_data_repository.dart';
import 'package:domain/models/sales_data.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/data/mapper/cache_to_domain.dart';

class GetSalesDataUC extends UseCase<void, List<SalesData>> {
  GetSalesDataUC({
    @required this.repository,
  }) : assert(repository != null);

  final SalesDataRepository repository;

  @override
  Future<List<SalesData>> getRawFuture({void params}) =>
      repository.getSalesDataList().then((salesDataList) => salesDataList
          .map(
            (salesData) => salesData.toDM(),
          )
          .toList());
}
