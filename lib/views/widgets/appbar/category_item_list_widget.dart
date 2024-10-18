import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/category_item_model.dart';
import 'package:yandeh_teste_dev/views/widgets/appbar/category_item_widget.dart';

class CategoryItemListWidget extends StatefulWidget {
  const CategoryItemListWidget({super.key});

  @override
  State<CategoryItemListWidget> createState() => _CategoryItemListWidgetState();
}

class _CategoryItemListWidgetState extends State<CategoryItemListWidget> {
  int categorySelected = 0;

  List<CategoryItemModel> listCategory = [
    CategoryItemModel(title: 'Todas as categorias'),
    CategoryItemModel(title: 'Campanhas'),
    CategoryItemModel(title: 'Frutas Yandeh'),
    CategoryItemModel(title: 'Indústrias e marcas'),
    CategoryItemModel(title: 'Pedidos'),
    CategoryItemModel(title: 'Importação de pedidos'),
  ];

  void clicked(int index) {
    setState(() {
      categorySelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 5);
        },
        itemCount: 5,
        padding: const EdgeInsets.only(right: 15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItemWidget(
            title: listCategory[index].title,
            isSelect: index == categorySelected,
            onTap: () => clicked(index),
          );
          // return list[index];
        },
      ),
    );
  }
}
