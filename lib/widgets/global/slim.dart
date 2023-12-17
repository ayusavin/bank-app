import 'package:bank_app/models/slim_data.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/widgets/global/title_block.dart';

class Slim extends StatelessWidget {
  final SlimData slim;

  const Slim({super.key, required this.slim});


  @override
  Widget build(BuildContext context) {
    final titleBlock = TitleBlock(title: slim.title, footnote: slim.description, titleStyle: Theme.of(context).textTheme.bodyMedium, height: 2,);

    final mediaQuery = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () => {},
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(child: slim.icon, width: 36, height: 36),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: mediaQuery - (64 + 48)),
                  child: titleBlock,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 24,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}