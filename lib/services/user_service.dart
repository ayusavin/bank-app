import 'package:bank_app/models/user.dart';

abstract class UserService {
  Future<User> getCurrentUser();
}
