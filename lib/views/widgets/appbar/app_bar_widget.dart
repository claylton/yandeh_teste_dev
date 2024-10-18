import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/category_item_list_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
          color: ColorTheme.whiteColor,
          boxShadow: [
            BoxShadow(
              color: ColorTheme.blackColor.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 50,
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: ColorTheme.whiteColor,
          toolbarHeight: widget.preferredSize.height,
          flexibleSpace: const Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Column(
              children: [
                Text(
                  'Mercadinho Maristela',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  '05.892.738/0001-24',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: ColorTheme.greyLightColor),
                ),
                SizedBox(height: 15),
                CategoryItemListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}