import 'package:flutter/material.dart';
import 'package:bank_app/widgets/global/title_block.dart';

class Card extends StatelessWidget {
  final Image image;
  final String text;
  final TitleBlock titleBlock;

  const Card({super.key, required this.image, required this.text, required this.titleBlock});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 216,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x114F4F6C),
                blurRadius: 14,
                offset: Offset(0, 8),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 10,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 14, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 36, height: 36, child: image),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                titleBlock
              ],
            ),
          ),
        ),
      ),
    );
  }
}
