import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/controllers/sections_controller.dart';
import 'package:yandeh_teste_dev/models/banner_divider_item_model.dart';
import 'package:yandeh_teste_dev/models/painel_card_item_model.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/app_bar_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/banner_divider/banner_divider_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/painel/painel_home_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/sections/section_shimmer_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/sections/sections_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SectionsController controller =
      SectionsController(dio: Dio(), pallet: const [
    Color(0xFF007C61),
    Color(0xFFED1C24),
    Color(0xFF35A88F),
    Color(0xFF7BBD1B),
    Color(0xFFEB7A7E),
  ]);
  List<SectionsItemModel> sections = [];
  @override
  void initState() {
    super.initState();
    loadSections();
  }

  Future<void> loadSections() async {
    sections = await controller.getSections(original: true);

    setState(() {
      sections = sections.where((e) => e.products.isNotEmpty).toList();
    });
  }

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
            const SizedBox(height: 32),
            ...((sections.length > 1)
                ? sections
                    .take(2)
                    .map((section) => SectionsWidget(section: section))
                : const [
                    SectionShimmerWidget(),
                    SectionShimmerWidget(),
                  ]),
            BannerDividerWidget(
              bannerDivider: BannerDividerItemModel.queridinhos(),
            ),
            if (sections.length > 3)
              ...sections
                  .skip(2)
                  .take(2)
                  .map((section) => SectionsWidget(section: section)),
            BannerDividerWidget(
              bannerDivider: BannerDividerItemModel.hortifruti(),
            ),
            if (sections.length > 5)
              ...sections
                  .skip(4)
                  .map((section) => SectionsWidget(section: section)),
          ],
        ),
      ),
    );
  }
}
