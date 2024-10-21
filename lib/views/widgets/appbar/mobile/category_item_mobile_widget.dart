import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class CategoryItemMobileWidget extends StatefulWidget {
  final String title;
  final bool isSelect;
  final void Function()? onTap;

  const CategoryItemMobileWidget({
    super.key,
    required this.title,
    required this.isSelect,
    required this.onTap,
  });

  @override
  State<CategoryItemMobileWidget> createState() =>
      _CategoryItemMobileWidgetState();
}

class _CategoryItemMobileWidgetState extends State<CategoryItemMobileWidget> {
  late bool isSelected;
  late bool isHovered;

  @override
  void initState() {
    super.initState();
    isHovered = false;
    isSelected = widget.isSelect;
  }

  void onTapUp(details) {
    setState(() {
      isSelected = widget.isSelect;
    });
  }

  void onTapDown(details) {
    setState(() {
      isSelected = true;
    });
  }

  void onEnter(point) {
    setState(() {
      isHovered = true;
    });
  }

  void onExit(point) {
    setState(() {
      isHovered = false;
      isSelected = widget.isSelect;
    });
  }

  Color getColor() {
    if (isSelected) return ColorTheme.blueDarkColor;
    if (isHovered) return ColorTheme.blueDarkColor.withOpacity(.2);
    return ColorTheme.whiteColor;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: GestureDetector(
          onTap: widget.onTap,
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: getColor(),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ColorTheme.greyLightColor,
              ),
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                height: 0,
                fontSize: 14,
                color:
                    isSelected ? ColorTheme.whiteColor : ColorTheme.blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
