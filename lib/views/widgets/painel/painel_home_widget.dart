import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_teste_dev/models/painel_card_item_model.dart';
import 'package:yandeh_teste_dev/views/widgets/painel/painel_card_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/video_player/video_player_widget.dart';

class PainelHomeWidget extends StatelessWidget {
  final List<PainelCardItemModel> cards;

  const PainelHomeWidget({super.key, required this.cards});

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
                        child: Container(
                          constraints: const BoxConstraints(
                            minWidth: 300,
                            maxWidth: 1168,
                          ),
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 280,
                          child: const VideoPlayerWidget(
                            url:
                                'https://s3-figma-videos-production-sig.figma.com/video/1033378068762196313/TEAM/0775/4c01/-be09-40d0-b052-d9b26d84f2a0?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=p4kSxwbSa9HXCJBbUVrPI-7dYPFrDyf6A1pJZ8cAVO0fALD7Pvl8NB93lQ33d79XlJJyGL9Ns3dRm7CoHp5kis2gnyU2kxRFq6wfybwv3lEbPawuMHJdZtkL5-qqOG2SwA6RXknq7WuojwtJ4SnUMJ-BeJ~nk4tPRXaTKBI1plstGIMweH3YYo67~p9EKydlFbbJG2lLSLCjl8Ni1H7dgaauTw~7752Htz12HT3lOA6i5K2IaE9bCPKtcyxZtKn~uy18p82CqvDYlOhxijCm2bBuT1czQT5YntwXEkgtAIKlmkGCZlOB0k1o3lKC7iWYyL~BsfyHuQbIzH9ur2ri8Q__',
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
