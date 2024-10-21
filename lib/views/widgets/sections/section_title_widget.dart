import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class SectionTitleWidget extends StatelessWidget {
  final SectionsItemModel section;
  const SectionTitleWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 650) {
        return Container(
          height: 54,
          decoration: BoxDecoration(
            color: ColorTheme.whiteColor,
            borderRadius: BorderRadius.circular(999),
          ),
          margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Text(
                section.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      }
      return Container(
        height: 48,
        decoration: BoxDecoration(
          color: ColorTheme.whiteColor,
          borderRadius: BorderRadius.circular(999),
        ),
        padding: const EdgeInsets.only(left: 16),
        margin: const EdgeInsets.all(24),
        child: Row(
          children: [
            Text(
              section.title,
              style: const TextStyle(
                color: ColorTheme.blueDarkColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              section.subtitle,
              style: const TextStyle(
                color: ColorTheme.blueDarkColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(24),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(child: Text('Ver ${section.products.length} items')),
            )
          ],
        ),
      );
    });
  }
}
