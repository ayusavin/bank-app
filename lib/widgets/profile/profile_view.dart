import 'package:bank_app/ioc.dart';
import 'package:bank_app/models/slim_data.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/const/localization.dart';
import 'package:bank_app/widgets/global/tag_chips.dart';
import 'package:bank_app/widgets/global/slims.dart';
import 'package:bank_app/widgets/global/cards.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).connectedTitle,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              S.of(context).connectedDescription,
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          ],
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 46),
                        child: SizedBox(
                          height: 130,
                          child: Cards(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).tariffsTitle,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              S.of(context).tariffsDescription,
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Slims(
                          getIt.get<Iterable<SlimData>>()
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             S.of(context).interestsTitle,
                             style: Theme.of(context).textTheme.titleLarge,
                           ),
                           const SizedBox(
                             height: 2,
                           ),
                           Text(
                             S.of(context).interestsDescription,
                             style: Theme.of(context).textTheme.labelLarge,
                           )
                         ],
                        )
                      ),
                      const TagChips(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
