import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/painel_card_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class PainelCardWidget extends StatelessWidget {
  final PainelCardItemModel card;
  const PainelCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          constraints: const BoxConstraints(minWidth: 208, minHeight: 112, maxWidth: 280, maxHeight: 115),
          decoration: BoxDecoration(
            color: card.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    card.title,
                    style: const TextStyle(
                      color: ColorTheme.whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(90, 0, 0),
                child: SizedBox(
                  width: 300,
                  child: Image.asset(
                    card.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
