import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/common/bottom_navigation/bottom_navigation_tab.dart';

class CupertinoScaffold extends StatelessWidget {
  CupertinoScaffold({
    @required this.tabList,
    @required this.onItemSelected,
    @required this.selectedIndex,
  })
      : assert(tabList != null),
        assert(onItemSelected != null),
        assert(selectedIndex != null);

  final List<BottomNavigationTab> tabList;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  Widget _buildPageFlow(BuildContext context, BottomNavigationTab item) =>
      CupertinoTabView(
        navigatorKey: item.key,
        onGenerateRoute: (settings) =>
            CupertinoPageRoute(
              settings: settings,
              builder: item.initialPageBuilder,
            ),
      );

  @override
  Widget build(BuildContext context) =>
      CupertinoTabScaffold(
        controller: CupertinoTabController(
          initialIndex: selectedIndex,
        ),
        tabBar: CupertinoTabBar(
          items: tabList.map((tab) => tab.item).toList(),
          onTap: (index) => onItemSelected(index),
        ),
        tabBuilder: (context, index) => _buildPageFlow(context, tabList[index]),
      );
}
