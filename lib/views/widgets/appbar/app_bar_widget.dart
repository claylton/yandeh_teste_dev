import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/mobile/app_bar_mobile_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/web/app_bar_web_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(140);
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
          flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isMobile = constraints.maxWidth < 650;
                  if (isMobile) return const AppBarMobileWidget();
                  return AppBarWebWidget();
                },
              )),
        ),
      ),
    );
  }
}
