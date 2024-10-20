import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final bool isSelect;
  final bool isWeb;
  final void Function()? onTap;

  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.isSelect,
    required this.onTap,
    required this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: isSelect && !isWeb ? ColorTheme.redCardProductColor : ColorTheme.whiteColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: isWeb
              ? Container(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.reorder,
                        size: 16,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          height: 0,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorTheme.blueDarkColor,
                        ),
                      ),
                    ],
                  ),
              )
              : Text(
                  title,
                  style: TextStyle(
                    height: 0,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelect ? ColorTheme.whiteColor : ColorTheme.blackColor,
                  ),
                ),
        ),
      ),
    );
  }
}
