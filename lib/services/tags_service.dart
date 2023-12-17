import 'package:bank_app/models/tag.dart';

abstract class TagsService {
  Future<Iterable<Tag>> listAll();
}
