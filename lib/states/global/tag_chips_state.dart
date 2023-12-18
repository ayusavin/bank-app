import 'package:bank_app/const/localization.dart';
import 'package:bank_app/ioc.dart';
import 'package:bank_app/models/tag.dart';
import 'package:bank_app/services/tags_service.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/global/tag_chips.dart';

class TagChipsState extends State<TagChips> with TickerProviderStateMixin {
  
  final TagsService _tagsService = getIt.get<TagsService>();
  List<Tag> _tags = [];

  Future<void> _loadTags() async {
    final tags = await _tagsService.listAll();
    setState(() {
      _tags = tags.toList();
    });
  }

  _buildChips() {
    return _tags.map((tag) => FilterChip(
          selected: tag.selected,
          label: Text(
              tag.slug,
              style: Theme.of(context).textTheme.labelMedium
          ),
          onSelected: (state) {
            setState(() {
              tag.selected = state;
            });
          },
        )).toList();
  }

  _buildWrap() =>  Wrap(
    spacing: 8,
    runSpacing: -4,
    children: _buildChips()
  );

  @override
  Widget build(BuildContext context) {
    if (_tags.isEmpty) {
    return FutureBuilder(
      future: _loadTags(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(20), 
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        } else if (snapshot.hasError) {
          return Text(S.of(context).fetchError);
        } else {
          return _buildWrap();
        }
      },
    );
    } else {
      return _buildWrap();
    }
  }
}
