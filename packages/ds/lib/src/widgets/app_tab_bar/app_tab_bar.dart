import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../ds.dart';

class AppTabData {
  int index;
  String title;
  Widget content;

  AppTabData({required this.index, required this.title, required this.content});
}

class AppTabBar extends StatelessWidget {
  final List<AppTabData> tabs;

  const AppTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return DynamicTabBarWidget(
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.center,
      onTabControllerUpdated: (controller) {},
      onTabChanged: (index) {},
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.primary, width: 2)),
      ),
      labelColor: colors.black,
      labelStyle: AppTypography.titleXs.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelColor: colors.neutral50,
      backIcon: Icon(Icons.arrow_back_ios, size: 14, color: colors.neutral40),
      nextIcon: Icon(Icons.arrow_forward_ios, size: 14, color: colors.neutral40),
      dynamicTabs: tabs.map((appTabData) => _parseToTabData(appTabData)).toList(),
    );
  }

  TabData _parseToTabData(AppTabData appTabData) {
    return TabData(
      index: appTabData.index,
      title: Tab(text: appTabData.title),
      content: appTabData.content,
    );
  }
}
