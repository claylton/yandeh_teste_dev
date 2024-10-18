import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/app_bar_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/painel/painel_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorTheme.whiteColor,
      appBar: AppBarWidget(),
      body: PainelHomeWidget(),
    );
  }
}
