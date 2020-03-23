import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/bar/bar_chart_page.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_page.dart';
import 'package:fluttergraphs/presentation/chart/pie/pie_chart_page.dart';
import 'package:fluttergraphs/presentation/common/bottom_navigation/adaptative_scaffold.dart';
import 'package:fluttergraphs/presentation/common/bottom_navigation/bottom_navigation_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BottomNavigationTab> tabList = [
    BottomNavigationTab(
      item: BottomNavigationBarItem(
        icon: Icon(Icons.insert_chart),
        title: Text('Bar Chart'),
      ),
      key: GlobalKey<NavigatorState>(),
      initialPageBuilder: (context) => BarChartPage.create(context),
    ),
    BottomNavigationTab(
      item: BottomNavigationBarItem(
        icon: Icon(Icons.show_chart),
        title: Text('Line Chart'),
      ),
      key: GlobalKey<NavigatorState>(),
      initialPageBuilder: (context) => LineChartPage.create(context),
    ),
    BottomNavigationTab(
      item: BottomNavigationBarItem(
        icon: Icon(Icons.pie_chart),
        title: Text('Pie Chart'),
      ),
      key: GlobalKey<NavigatorState>(),
      initialPageBuilder: (context) => PieChartPage.create(context),
    ),
  ];

  @override
  Widget build(BuildContext context) => AdaptativeScaffold(
        tabList: tabList,
      );
}
