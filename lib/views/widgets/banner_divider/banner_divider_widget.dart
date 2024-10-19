import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/banner_divider_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/video_player/video_player_widget.dart';

class BannerDividerWidget extends StatelessWidget {
  final BannerDividerItemModel bannerDivider;
  const BannerDividerWidget({super.key, required this.bannerDivider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: LayoutBuilder(builder: (context, constraints) {
        var isMobile = constraints.maxWidth < 650;

        double containerHeight = isMobile ? 184 : 280;
        double titleFontSize = isMobile ? 18 : 35;
        double subtitleFontSize = isMobile ? 12 : 20;
        double seeMoreFontSize = isMobile ? 12 : 14;

        return ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            constraints: const BoxConstraints(
              minWidth: 300,
              maxWidth: 1168,
            ),
            child: Stack(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 1168,
                  ),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: containerHeight,
                  child: VideoPlayerWidget(
                    url: bannerDivider.url,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: containerHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorTheme.redCardProductColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 2),
                              child: Center(
                                child: Text(
                                  bannerDivider.title,
                                  style: TextStyle(
                                    color: ColorTheme.whiteColor,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                bannerDivider.subtitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorTheme.whiteColor,
                                  fontSize: subtitleFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border:
                                    Border.all(color: ColorTheme.whiteColor),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 4),
                              child: Center(
                                child: Text(
                                  "Ver mais",
                                  style: TextStyle(
                                    color: ColorTheme.whiteColor,
                                    fontSize: seeMoreFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
