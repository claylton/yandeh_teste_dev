import 'package:flutter/material.dart';
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
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mercearia Dois Irmãos'),
                      Text('07.666.444/7773-29'),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 32,
                ),
              ],
            ),
          ),
        Container(
          height: 40,
          width: show ? 136 : null,
          child: FloatingActionButton(
            backgroundColor: ColorTheme.redCardProductColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24), // Bordas arredondadas
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: ColorTheme.whiteColor,
                  size: 18,
                ),
                if (show)
                  const Text(
                    'Carrinho',
                    style: TextStyle(
                      color: ColorTheme.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
