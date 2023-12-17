import 'package:bank_app/const/localization.dart';
import 'package:bank_app/const/resource.dart';
import 'package:bank_app/models/slim_data.dart';
import 'package:bank_app/models/tab.dart';
import 'package:bank_app/services/impl/mock_profile_card_service.dart';
import 'package:bank_app/services/impl/mock_tags_servide.dart';
import 'package:bank_app/services/impl/mock_user_service.dart';
import 'package:bank_app/services/profile_card_service.dart';
import 'package:bank_app/services/tags_service.dart';
import 'package:bank_app/services/user_service.dart';
import 'package:bank_app/widgets/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Function _preBuildDependenciesStrategy = (BuildContext context) {
  final locale = S.of(context);
  getIt.registerSingleton<Iterable<SlimData>>(
    [
      SlimData(locale.limitsTitle, locale.limitsDescription, Image.asset(R.ASSETS_IMAGES_SPEEDOMETER_PNG), (){}),
      SlimData(locale.feesTitle, locale.feesDescription, Image.asset(R.ASSETS_IMAGES_PERCENT_PNG), (){}),
      SlimData(locale.tariffsLimitsInformationTitle, locale.tariffsLimitsInformationDescription, Image.asset(R.ASSETS_IMAGES_ARROWS_PNG), (){})
    ]
  );
  getIt.registerSingleton<Iterable<TabData>>(
    [
      TabData(locale.profile, () => const ProfileView()),
      TabData(locale.settings, () => Container())
    ], instanceName: 'profile'
  );
  _preBuildDependenciesStrategy = (BuildContext context){};
};

void preRunDependenciesSetup() {
  getIt.registerSingleton<UserService>(MockUserService());
  getIt.registerSingleton<TagsService>(MockTagsService());
  getIt.registerSingleton<ProfileCardService>(MockProfileCardService());
}

void preBuildDependenciesSetup(BuildContext context) {
  _preBuildDependenciesStrategy(context);
}
