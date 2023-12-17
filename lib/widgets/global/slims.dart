import 'package:bank_app/models/slim_data.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/global/slim.dart';

class Slims extends StatelessWidget {
  const Slims(this._slims, {super.key});

  final Iterable<SlimData> _slims;

  @override
  Widget build(BuildContext context) {
    final slimDivider = Divider(
      height: 1,
      indent: 48,
      color: Theme.of(context).dividerColor,
    );

    final slims = _slims.expand((slim) => [Slim(slim: slim), slimDivider]).toList();
    slims.removeLast();
    return Column(
      children: slims
    );
  }
}
