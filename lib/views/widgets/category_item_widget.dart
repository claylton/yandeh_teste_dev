import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final bool isSelect;
  final void Function()? onTap;

  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: isSelect ? ColorTheme.blueDarkColor : ColorTheme.whiteColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ColorTheme.greyLightColor,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              height: 0,
              fontSize: 14,
              color: isSelect ? ColorTheme.whiteColor : ColorTheme.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
