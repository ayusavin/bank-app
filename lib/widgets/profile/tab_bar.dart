import 'package:bank_app/ioc.dart';
import 'package:bank_app/models/tab.dart';
import 'package:flutter/material.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = getIt.get<Iterable<TabData>>(instanceName: 'profile');

    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        TabBar(
          tabs: tabs.map((tab) => Tab(height: 56, text: tab.name)).toList()
        ),
      ),
      pinned: true,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
