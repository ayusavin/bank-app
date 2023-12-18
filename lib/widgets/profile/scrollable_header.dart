import 'package:bank_app/ioc.dart';
import 'package:bank_app/models/user.dart';
import 'package:bank_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/const/resource.dart';

class ScrollableHeader extends StatefulWidget {
  ScrollableHeader({Key? key}) : super(key: key);

  @override
  _ScrollableHeaderState createState() => _ScrollableHeaderState();
}

class _ScrollableHeaderState extends State<ScrollableHeader> {
  final UserService _users = getIt.get<UserService>();
  User? current;

  @override
  void initState() {
    super.initState();
    _getCurentUser();
  }

  _getCurentUser() async {
    setState(() {
      current = null; // Reset current to null when fetching data.
    });

    final user = await _users.getCurrentUser();
    setState(() {
      current = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        leading: IconButton(
          icon: Image.asset(R.ASSETS_IMAGES_CROSS_PNG),
          onPressed: () => {},
        ),
        actions: [
          IconButton(
            icon: Image.asset(R.ASSETS_IMAGES_EXIT_PNG),
            onPressed: () => {},
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        floating: true,
        pinned: true,
        snap: true,
        expandedHeight: 222.0,
        flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1.5,
          titlePadding: const EdgeInsets.all(15),
          collapseMode: CollapseMode.pin,
          centerTitle: true,
          title: current != null? 
          Text(
            current!.firstName,
            style: Theme.of(context).textTheme.displayMedium, 
          ) :
          const Text(""),
          background: Padding(
            padding: const EdgeInsets.only(bottom: 36, top: 30),
            child: current?.thumbnail ?? Container(),
          ),
        ),
      ),
    );
  }
}
