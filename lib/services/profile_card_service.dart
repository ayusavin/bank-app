import 'package:bank_app/models/profile_card.dart';

abstract class ProfileCardService {
  Future<Iterable<ProfileCard>> listAll();
}
