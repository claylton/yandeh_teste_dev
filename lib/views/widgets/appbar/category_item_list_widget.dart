import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/controllers/sections_controller.dart';
import 'package:yandeh_teste_dev/database/product_database.dart';
import 'package:yandeh_teste_dev/models/category_item_model.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/mobile/category_item_mobile_widget.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/web/category_item_web_widget.dart';

class CategoryItemListWidget extends StatefulWidget {
  final bool isWeb;
  const CategoryItemListWidget({super.key, required this.isWeb});

  @override
  State<CategoryItemListWidget> createState() => _CategoryItemListWidgetState();
}

class _CategoryItemListWidgetState extends State<CategoryItemListWidget> {
  int categorySelected = 2;
  final SectionsController controller = SectionsController(ProductDatabase());
  List<CategoryItemModel> listCategory = [
    CategoryItemModel(title: 'Todas as categorias'),
    CategoryItemModel(title: 'Campanhas'),
    CategoryItemModel(title: 'Frutas Yandeh'),
    CategoryItemModel(title: 'Indústrias e marcas'),
    CategoryItemModel(title: 'Pedidos'),
    CategoryItemModel(title: 'Importação de pedidos'),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * (widget.isWeb ? 0.65 : 0.95),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(width: 5);
          },
          itemCount: listCategory.length,
          padding: const EdgeInsets.only(right: 15),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (widget.isWeb) {
              return CategoryItemWebWidget(
                title: listCategory[index].title,
                isSelect: index == categorySelected,
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
                isFirst: index == 0,
              );
            }
            return CategoryItemMobileWidget(
              title: listCategory[index].title,
              isSelect: index == categorySelected,
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            );
          },
        ),
      ),
    );
  }
}
