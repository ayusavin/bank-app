import 'package:bank_app/ioc.dart';
import 'package:bank_app/models/tab.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/profile/scrollable_header.dart';
import 'package:bank_app/widgets/profile/tab_bar.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    preBuildDependenciesSetup(context);

    final tabs = getIt.get<Iterable<TabData>>(instanceName: 'profile').toList();
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              ScrollableHeader(),
              const ProfileTabBar()
            ];
          },
          body: TabBarView(
            children: tabs.map((tab) => tab.widgetFactory() as Widget) .toList(),
          ),
        ),
      ),
    );
  }
}