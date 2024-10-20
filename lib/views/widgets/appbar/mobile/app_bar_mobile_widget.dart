import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/category_item_list_widget.dart';

class AppBarMobileWidget extends StatelessWidget {
  const AppBarMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
        CategoryItemListWidget(isWeb: false),
      ],
    );
  }
}
