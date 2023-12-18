import 'package:bank_app/ioc.dart';
import 'package:bank_app/models/profile_card.dart';
import 'package:bank_app/services/profile_card_service.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/const/localization.dart';
import 'package:bank_app/widgets/global/title_block.dart';
import 'package:bank_app/widgets/global/card.dart' as card_widget;

class Cards extends StatefulWidget {
  Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  late Future<Iterable<ProfileCard>> _profileCardsFuture;

  @override
  void initState() {
    super.initState();
    _profileCardsFuture = _fetchProfileCards();
  }

  Future<Iterable<ProfileCard>> _fetchProfileCards() async {
    final profileCards = await getIt.get<ProfileCardService>().listAll();
    return profileCards;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<ProfileCard>>(
      future: _profileCardsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingIndicator();
        } else if (snapshot.hasError) {
          return _buildErrorIndicator();
        } else {
          final profileCards = snapshot.data!;
          return _buildCardsList(profileCards);
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorIndicator() {
    return Center(
      child: Text(S.of(context).fetchError),
    );
  }

  Widget _buildCardsList(Iterable<ProfileCard> profileCards) {
    return ListView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
        decelerationRate: ScrollDecelerationRate.fast,
      ),
      children: profileCards.map((card) {
        return card_widget.Card(
          image: card.icon,
          text: card.title,
          titleBlock: TitleBlock(
            height: 2,
            title: card.subTitle,
            footnote: card.description,
            titleStyle: Theme.of(context).textTheme.labelMedium,
            footnoteStyle: Theme.of(context).textTheme.labelSmall,
          ),
        );
      }).toList(),
    );
  }
}
