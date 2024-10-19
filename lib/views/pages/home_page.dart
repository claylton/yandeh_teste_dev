import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/banner_divider_item_model.dart';
import 'package:yandeh_teste_dev/models/painel_card_item_model.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/app_bar_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/banner_divider/banner_divider_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/painel/painel_home_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/sections/sections_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColor,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PainelHomeWidget(
              cards: [
                PainelCardItemModel.legumes(),
                PainelCardItemModel.frutas(),
                PainelCardItemModel.temperos(),
              ],
            ),
            SizedBox(height: 32),
            SectionsWidget(section: SectionsItemModel.placeholder()),
            SectionsWidget(section: SectionsItemModel.placeholder()),
            BannerDividerWidget(
              bannerDivider: BannerDividerItemModel.placeholder(),
            ),
            SectionsWidget(section: SectionsItemModel.placeholder()),
            SectionsWidget(section: SectionsItemModel.placeholder()),
            BannerDividerWidget(
              bannerDivider: BannerDividerItemModel.placeholder(),
            ),
            SectionsWidget(section: SectionsItemModel.placeholder()),
            SectionsWidget(section: SectionsItemModel.placeholder()),
          ],
        ),
      ),
    );
  }
}
