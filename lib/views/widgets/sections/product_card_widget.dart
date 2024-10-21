import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/product_card_item_model.dart';
import 'package:yandeh_teste_dev/views/extensions/string_extension.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductCardItemModel product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 392,
          decoration: BoxDecoration(
            color: ColorTheme.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 182,
                height: 182,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 182,
                            height: 182,
                            child: Image.network(
                              'https://picsum.photos/182/${182 + Random().nextInt(20)}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: ColorTheme.redCardProductColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            color: ColorTheme.whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 166,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        'R\$ ${product.price.toString().replaceFirst('.', ',')} ${product.unitMeasure}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ColorTheme.blueDarkColor
                        ),
                      ),
                      Text(
                        product.name.captalizeWords(),
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorTheme.blackColor,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorTheme.blueLightCardProductColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            child: Center(
                              child: Text(
                                '${product.unitContent} ${product.unitMeasure}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        product.ean,
                        style: const TextStyle(
                          color: ColorTheme.greyCardProductColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            product.package == 'UNIDADE'
                            ? product.package.captalize()
                            : "${product.package.captalize()} c/${product.packageQuantity}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Yandeh',
                          style: TextStyle(
                            color: ColorTheme.greyCardProductColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
