import 'package:domain/data_repository/sales_data_repository.dart';
import 'package:domain/models/sales_data.dart';

class SalesRepository implements SalesDataRepository {
  Future<List<SalesData>> getSalesDataList() async => _salesDataList;

  final _salesDataList = [
    new SalesData(
      year: 0,
      sales: 1500000,
    ),
    new SalesData(
      year: 1,
      sales: 1735000,
    ),
    new SalesData(
      year: 2,
      sales: 1678000,
    ),
    new SalesData(
      year: 3,
      sales: 1890000,
    ),
    new SalesData(
      year: 4,
      sales: 1907000,
    ),
    new SalesData(
      year: 5,
      sales: 2300000,
    ),
    new SalesData(
      year: 6,
      sales: 2360000,
    ),
    new SalesData(
      year: 7,
      sales: 1980000,
    ),
    new SalesData(
      year: 8,
      sales: 2654000,
    ),
    new SalesData(
      year: 10,
      sales: 3020000,
    ),
    new SalesData(
      year: 11,
      sales: 3245900,
    ),
    new SalesData(
      year: 12,
      sales: 4098500,
    ),
    new SalesData(
      year: 13,
      sales: 4500000,
    ),
    new SalesData(
      year: 14,
      sales: 4456500,
    ),
    new SalesData(
      year: 15,
      sales: 3900500,
    ),
    new SalesData(
      year: 16,
      sales: 5123400,
    ),
    new SalesData(
      year: 17,
      sales: 5589000,
    ),
    new SalesData(
      year: 18,
      sales: 5940000,
    ),
    new SalesData(
      year: 19,
      sales: 6367000,
    ),
  ];
}
