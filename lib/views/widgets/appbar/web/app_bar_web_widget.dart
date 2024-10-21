import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/category_item_list_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/web/cart_button_widget.dart';

class AppBarWebWidget extends StatelessWidget {
  final FocusNode myFocusNode = FocusNode();

  AppBarWebWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            constraints: const BoxConstraints(
              minWidth: 300,
              maxWidth: 1608,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/logo_image_header_web.svg',
                  height: 40,
                  width: 160,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorTheme.whiteColor,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.14),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(left: 16),
                    margin: const EdgeInsets.all(24),
                    child: TextField(
                      cursorColor: ColorTheme.blackColor.withOpacity(0.7),
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Buscar produtos',
                        labelStyle: const TextStyle(color: ColorTheme.greyDarkColor, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: ColorTheme.greyIconSearchColor,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                ),
                const CartButtonWidget(),
              ],
            ),
          ),
        ),
        const CategoryItemListWidget(
          isWeb: true,
        ),
      ],
    );
  }
}
