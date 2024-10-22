import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final SectionsController controller = SectionsController();
  List<SectionsItemModel> sections = [];
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
    setState(() {
      isFirstCall = true;
    });
  }

  Future<void> _checkIfFirstCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstCall = prefs.getBool('first_call');

    if (isFirstCall == null || isFirstCall == true) {
      loadSections(true);
      setState(() {
        isFirstCall = true;
      });
      prefs.setBool('first_call', false);
    } else {
      loadSections(false);
      setState(() {
        isFirstCall = false;
      });

    }
  }

  @override
  void didChangeDependencies() {
    _checkIfFirstCall();
    super.didChangeDependencies();
  }

  Future<void> loadSections(bool original) async {
    sections = await controller.getSections(original: original);
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
                ? sections.take(2).map((section) => SectionsWidget(section: section))
                : const [
                    SectionShimmerWidget(),
                    SectionShimmerWidget(),
                  ]),
            BannerDividerWidget(
              bannerDivider: BannerDividerItemModel.queridinhos(),
            ),
            if (sections.length > 3) ...sections.skip(2).take(2).map((section) => SectionsWidget(section: section)),
            BannerDividerWidget(
              bannerDivider: BannerDividerItemModel.hortifruti(),
            ),
            if (sections.length > 5) ...sections.skip(4).map((section) => SectionsWidget(section: section)),
          ],
        ),
      ),
    );
  }
}
