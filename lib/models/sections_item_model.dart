// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:yandeh_teste_dev/models/product_card_item_model.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class SectionsItemModel {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final List<ProductCardItemModel> products;

  SectionsItemModel(
      {required this.title,
      required this.subtitle,
      required this.backgroundColor,
      required this.products});

  factory SectionsItemModel.placeholder() {
    return SectionsItemModel(
      title: 'Fracionados',
      subtitle: 'Produtos prontos para exposição',
      backgroundColor: ColorTheme.greenDarkColor,
      products: [
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
        ProductCardItemModel.placeholder(),
      ],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'backgroundColor': backgroundColor.value,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory SectionsItemModel.fromMap(Map<String, dynamic> map) {
    return SectionsItemModel(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      backgroundColor: Color(map['backgroundColor'] as int),
      products: List<ProductCardItemModel>.from(
        (map['products'] as List<int>).map<ProductCardItemModel>(
          (x) => ProductCardItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionsItemModel.fromJson(String source) =>
      SectionsItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
