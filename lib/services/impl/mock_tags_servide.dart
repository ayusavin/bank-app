
import 'package:bank_app/models/tag.dart';
import 'package:bank_app/services/tags_service.dart';

class MockTagsService implements TagsService {

  final Iterable<Tag> _tags = [
    "Еда","Саморазвитие", "Технологии", 
    "Дом", "Досуг", "Забота о себе", "Наука"
  ].map((slug) => Tag(slug));


  @override
  Future<Iterable<Tag>> listAll() async {
    return _tags;
  }
}
 