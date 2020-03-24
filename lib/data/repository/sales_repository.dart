import 'package:domain/data_repository/sales_data_repository.dart';
import 'package:fluttergraphs/data/model/sales_data_cm.dart';

class SalesRepository implements SalesDataRepository {
  Future<List<SalesDataCM>> getSalesDataList() async => _salesDataList;

  final _salesDataList = [
    new SalesDataCM(
      year: 0,
      sales: 1500000,
    ),
    new SalesDataCM(
      year: 1,
      sales: 1735000,
    ),
    new SalesDataCM(
      year: 2,
      sales: 1678000,
    ),
    new SalesDataCM(
      year: 3,
      sales: 1890000,
    ),
    new SalesDataCM(
      year: 4,
      sales: 1907000,
    ),
    new SalesDataCM(
      year: 5,
      sales: 2300000,
    ),
    new SalesDataCM(
      year: 6,
      sales: 2360000,
    ),
    new SalesDataCM(
      year: 7,
      sales: 1980000,
    ),
    new SalesDataCM(
      year: 8,
      sales: 2654000,
    ),
    new SalesDataCM(
      year: 10,
      sales: 3020000,
    ),
    new SalesDataCM(
      year: 11,
      sales: 3245900,
    ),
    new SalesDataCM(
      year: 12,
      sales: 4098500,
    ),
    new SalesDataCM(
      year: 13,
      sales: 4500000,
    ),
    new SalesDataCM(
      year: 14,
      sales: 4456500,
    ),
    new SalesDataCM(
      year: 15,
      sales: 3900500,
    ),
    new SalesDataCM(
      year: 16,
      sales: 5123400,
    ),
    new SalesDataCM(
      year: 17,
      sales: 5589000,
    ),
    new SalesDataCM(
      year: 18,
      sales: 5940000,
    ),
    new SalesDataCM(
      year: 19,
      sales: 6367000,
    ),
  ];
}
