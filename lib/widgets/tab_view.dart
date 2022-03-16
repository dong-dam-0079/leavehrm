
import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  final String tabName1, tabName2;
  final double marginHorizontal;

  const TabView({
    Key? key, required this.tabName1, required this.tabName2, required this.marginHorizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: const Color(-1261515058),
          borderRadius:
          BorderRadius.circular(15)),
      child: TabBar(
        indicator: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(15)),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(text: tabName1),
          Tab(text: tabName2)
        ],
      ),
    );
  }
}