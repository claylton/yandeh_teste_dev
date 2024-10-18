import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/app_bar_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/painel/painel_home_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/sections/sections_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColor,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PainelHomeWidget(),
            const SizedBox(height: 32),
            SectionsWidget(section: SectionsItemModel.placeholder())
          ],
        ),
      ),
    );
  }
}
