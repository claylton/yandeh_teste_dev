import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';
import 'package:yandeh_teste_dev/views/widgets/sections/product_card_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/sections/section_title_widget.dart';

class SectionsWidget extends StatefulWidget {
  final SectionsItemModel section;
  const SectionsWidget({super.key, required this.section});

  @override
  State<SectionsWidget> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<SectionsWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 500,
        constraints: const BoxConstraints(
          minWidth: 300,
          maxWidth: 1224,
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 300,
                  maxWidth: 1168,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 376,
                      decoration: BoxDecoration(
                        color: widget.section.backgroundColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    Column(
                      children: [
                        SectionTitleWidget(section: widget.section),
                        LayoutBuilder(builder: (context, constraints) {
                          double padding = constraints.maxWidth < 650 ? 8 : 24;
                          return Padding(
                            padding: EdgeInsets.only(left: padding),
                            child: SizedBox(
                              height: 400,
                              child: ListView.separated(
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ProductCardWidget(
                                    product: widget.section.products[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: padding);
                                },
                                itemCount: widget.section.products.length,
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: LayoutBuilder(builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 650;
                if (isMobile) return const SizedBox();
                return FloatingActionButton(
                  backgroundColor: ColorTheme.whiteColor,
                  onPressed: () {
                    scrollController.animateTo(
                      scrollController.offset + 206,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                );
              }),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: LayoutBuilder(builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 650;
                if (isMobile) return const SizedBox();
                return FloatingActionButton(
                  backgroundColor: ColorTheme.whiteColor,
                  onPressed: () {
                    scrollController.animateTo(
                      scrollController.offset - 206,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Center(
                      child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(-1.0, 1.0), // Flip along the X-axis
                    child: const Icon(
                      Icons.arrow_forward_ios,
                    ), // Replace with your actual widget
                  )),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
