import 'package:flutter/material.dart';

class TitleBlock extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? footnote;
  final TextStyle? footnoteStyle;
  final double? height;
  const TitleBlock(
      {super.key,
      this.footnote,
      required this.title,
      this.titleStyle,
      this.footnoteStyle,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
        ),
        if (footnote != null)
          SizedBox(
            height: height ?? 8,
          ),
        if (footnote != null)
          Text(
            footnote!,
            style: footnoteStyle ?? Theme.of(context).textTheme.labelLarge,
          )
      ],
    );
  }
}
