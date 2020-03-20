import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/bar_chart/bar_chat_page.dart';
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
      initialPageBuilder: (_) => BarChartPage(),
    ),
    BottomNavigationTab(
      item: BottomNavigationBarItem(
        icon: Icon(Icons.show_chart),
        title: Text('Line Chart'),
      ),
      key: GlobalKey<NavigatorState>(),
      initialPageBuilder: (_) => BarChartPage(),
    ),
    BottomNavigationTab(
      item: BottomNavigationBarItem(
        icon: Icon(Icons.pie_chart),
        title: Text('Pie Chart'),
      ),
      key: GlobalKey<NavigatorState>(),
      initialPageBuilder: (_) => BarChartPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptativeScaffold(
      tabList: tabList,
    );
  }
}
