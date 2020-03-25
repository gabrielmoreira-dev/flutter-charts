import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/common/bottom_navigation/bottom_navigation_tab.dart';

class MaterialScaffold extends StatefulWidget {
  MaterialScaffold({
    @required this.tabList,
    @required this.onItemSelected,
    @required this.selectedIndex,
  })  : assert(tabList != null),
        assert(onItemSelected != null),
        assert(selectedIndex != null);

  final List<BottomNavigationTab> tabList;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  @override
  _MaterialScaffoldState createState() => _MaterialScaffoldState();
}

class _MaterialScaffoldState extends State<MaterialScaffold> {
  final _shouldBuildTab = <bool>[];

  @override
  void initState() {
    _shouldBuildTab.addAll(
      List<bool>.filled(
        widget.tabList.length,
        false,
      ),
    );
    super.initState();
  }

  Widget _buildPageFlow(
      BuildContext context, int index, BottomNavigationTab tab) {
    final isCurrentlySelected = index == widget.selectedIndex;

    _shouldBuildTab[index] = isCurrentlySelected || _shouldBuildTab[index];

    return _shouldBuildTab[index]
        ? Navigator(
            key: tab.key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              settings: settings,
              builder: tab.initialPageBuilder,
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.selectedIndex,
        children: widget.tabList
            .map(
              (tab) => _buildPageFlow(
                context,
                widget.tabList.indexOf(tab),
                tab,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          items: widget.tabList.map((tab) => tab.item).toList(),
          onTap: (index) => widget.onItemSelected(index),
        ),

    );
  }
}
