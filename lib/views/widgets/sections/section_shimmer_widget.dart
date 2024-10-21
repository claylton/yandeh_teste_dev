import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class SectionShimmerWidget extends StatelessWidget {
  const SectionShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11),
      child: Shimmer.fromColors(
        baseColor: ColorTheme.whiteColor,
        highlightColor: ColorTheme.greyLightColor.withOpacity(.5),
        child: Container(
          height: 376,
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 1224,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}
