import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandeh_teste_dev/controllers/sections_controller.dart';
import 'package:yandeh_teste_dev/database/product_database.dart';
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
  final SectionsController controller = SectionsController(ProductDatabase());

  bool? original;
  bool? isFirstCall;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.lifecycleState;
    AppLifecycleListener(
      onPause: () => _resetFirstCall(),
    );
  }

  Future<void> _resetFirstCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_call', true);
  }

  Future<void> _checkIfFirstCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstCall = prefs.getBool('first_call');

    if (isFirstCall == null || isFirstCall == true) {
      controller.loadSections(true);
      prefs.setBool('first_call', false);
    } else {
      controller.loadSections(false);
    }
  }

  @override
  void didChangeDependencies() {
    _checkIfFirstCall();
    super.didChangeDependencies();
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
            ValueListenableBuilder<List<SectionsItemModel>>(
                valueListenable: controller,
                builder: (context, sections, child) {
                  return Column(
                    children: [
                      const SizedBox(height: 32),
                      ...((controller.sections.length > 1)
                          ? controller.sections.take(2).map((section) => SectionsWidget(section: section))
                          : const [
                              SectionShimmerWidget(),
                              SectionShimmerWidget(),
                            ]),
                      BannerDividerWidget(
                        bannerDivider: BannerDividerItemModel.queridinhos(),
                      ),
                      if (controller.sections.length > 3) ...controller.sections.skip(2).take(2).map((section) => SectionsWidget(section: section)),
                      BannerDividerWidget(
                        bannerDivider: BannerDividerItemModel.hortifruti(),
                      ),
                      if (controller.sections.length > 5) ...controller.sections.skip(4).map((section) => SectionsWidget(section: section)),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
