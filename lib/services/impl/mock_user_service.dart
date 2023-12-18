
import 'package:bank_app/models/user.dart';
import 'package:bank_app/services/user_service.dart';
import 'package:bank_app/const/resource.dart';
import 'package:flutter/material.dart';

class MockUserService implements UserService {

  final User _currentUser = User('', 'Екатерина', '', Image.asset(R.ASSETS_IMAGES_PHOTO_PNG));

  MockUserService();

  @override
  Future<User> getCurrentUser() async {
    return _currentUser;
  }
}
