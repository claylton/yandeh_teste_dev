import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class CategoryItemWebWidget extends StatefulWidget {
  final String title;
  final bool isSelect;
  final bool isFirst;
  final void Function()? onTap;

  const CategoryItemWebWidget({
    super.key,
    required this.title,
    required this.isSelect,
    required this.onTap,
    required this.isFirst,
  });

  @override
  State<CategoryItemWebWidget> createState() => _CategoryItemWebWidgetState();
}

class _CategoryItemWebWidgetState extends State<CategoryItemWebWidget> {
  late bool isSelected;
  late bool isHovered;
  late bool isClicked;

  @override
  void initState() {
    super.initState();
    isHovered = false;
    isClicked = false;
    isSelected = widget.isSelect;
  }

  void onTapUp(details) {
    setState(() {
      isSelected = widget.isSelect;
      isClicked = false;
    });
  }

  void onTapDown(details) {
    setState(() {
      isSelected = true;
      isClicked = true;
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
      isClicked = false;
    });
  }

  Color getColor() {
    if (widget.isFirst) {
      if (isHovered) return ColorTheme.blueDarkColor.withOpacity(.2);
      return ColorTheme.whiteColor;
    }
    if (isClicked) return ColorTheme.blueDarkColor;
    if (isSelected) return ColorTheme.redCardProductColor;
    if (isHovered) return ColorTheme.blueDarkColor.withOpacity(.2);
    return ColorTheme.whiteColor;
  }

  Color getTextColor() {
    if (widget.isFirst) return ColorTheme.blueDarkColor;
    if (isClicked) return ColorTheme.whiteColor;
    if (isSelected) return ColorTheme.whiteColor;
    if (isHovered) return ColorTheme.blueDarkColor;
    return ColorTheme.blueDarkColor;
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
              borderRadius: BorderRadius.circular(24),
            ),
            child: widget.isFirst
                ? SizedBox(
                    width: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/list_icon.svg',
                          height: 18,
                          width: 18,
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
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
                    widget.title,
                    style: TextStyle(
                      // height: 0,
                      fontSize: 14,
                      fontWeight: widget.isSelect ? FontWeight.w400 : FontWeight.w600,
                      color: getTextColor(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
