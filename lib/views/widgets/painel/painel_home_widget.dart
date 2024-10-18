import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_teste_dev/models/painel_card_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/painel/painel_card_widget.dart';

class PainelHomeWidget extends StatefulWidget {
  const PainelHomeWidget({super.key});

  @override
  State<PainelHomeWidget> createState() => _PainelHomeWidgetState();
}

class _PainelHomeWidgetState extends State<PainelHomeWidget> {
  final List<PainelCardItemModel> cards = [
    PainelCardItemModel(
      title: 'Legumes',
      image: 'assets/images/legumes_image.png',
      color: ColorTheme.greenDarkColor,
    ),
    PainelCardItemModel(
      title: 'Frutas',
      image: 'assets/images/frutas_image.png',
      color: ColorTheme.greenLightColor,
    ),
    PainelCardItemModel(
      title: 'Temperos',
      image: 'assets/images/temperos_image.png',
      color: ColorTheme.salmonColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 317,
      margin: const EdgeInsets.only(top: 30),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              constraints: const BoxConstraints(
                minWidth: 300,
                maxWidth: 1168,
              ),
              child: SizedBox(
                height: 317,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        child: SizedBox(
                          height: 280,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Image.asset(
                            'assets/gifs/home_page_gif.gif',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 86,
                          width: 342,
                          child:
                              SvgPicture.asset('assets/images/logo_image.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 48),
                  ...cards.map(
                    (card) => PainelCardWidget(
                      card: card,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
