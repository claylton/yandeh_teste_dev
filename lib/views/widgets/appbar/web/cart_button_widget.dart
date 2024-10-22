import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool show = MediaQuery.of(context).size.width > 900;

    return Row(
      children: [
        if (show)
          const SizedBox(
            width: 256,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 43,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mercearia Dois Irmãos',
                        style: TextStyle(
                          color: ColorTheme.blueDarkColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '07.666.444/7773-29',
                        style: TextStyle(
                          color: ColorTheme.greyCNPJWebColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: ColorTheme.blueDarkColor,
                  size: 32,
                ),
              ],
            ),
          ),
        SizedBox(
          height: 40,
          width: show ? 136 : null,
          child: FloatingActionButton(
            backgroundColor: ColorTheme.redCardProductColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/cart_icon.svg',
                  height: 18,
                  width: 18,
                ),
                if (show)
                  const Padding(
                    padding: EdgeInsets.only(left: 9.5),
                    child: Text(
                      'Carrinho',
                      style: TextStyle(
                        color: ColorTheme.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
