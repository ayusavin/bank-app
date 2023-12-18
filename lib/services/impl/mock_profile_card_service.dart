
import 'package:bank_app/const/resource.dart';
import 'package:bank_app/models/profile_card.dart';
import 'package:bank_app/services/profile_card_service.dart';
import 'package:flutter/material.dart';

class MockProfileCardService implements ProfileCardService {
  final Iterable<ProfileCard> _profileCards = [
    ProfileCard('СберПрайм', 'Платёж 9 июля', '199 ₽ в месяц', Image.asset(R.ASSETS_IMAGES_FLAG_PNG)),
    ProfileCard('Переводы', 'Автопродление 21/09/2023', '199 ₽ в месяц', Image.asset(R.ASSETS_IMAGES_PERCENT_PNG))
  ];
  
  @override
  Future<Iterable<ProfileCard>> listAll() async{
    return _profileCards;
  }

}