import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class PainelCardItemModel {
  final String title;
  final String image;
  final Color color;

  PainelCardItemModel({
    required this.title,
    required this.image,
    required this.color,
  });

  factory PainelCardItemModel.legumes() {
    return PainelCardItemModel(
      title: 'Legumes',
      image: 'assets/images/legumes_image.png',
      color: ColorTheme.greenDarkColor,
    );
  }

  factory PainelCardItemModel.frutas() {
    return PainelCardItemModel(
      title: 'Frutas',
      image: 'assets/images/frutas_image.png',
      color: ColorTheme.greenLightColor,
    );
  }

  factory PainelCardItemModel.temperos() {
    return PainelCardItemModel(
      title: 'Temperos',
      image: 'assets/images/temperos_image.png',
      color: ColorTheme.salmonColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'color': color.value,
    };
  }

  factory PainelCardItemModel.fromMap(Map<String, dynamic> map) {
    return PainelCardItemModel(
      title: map['title'] as String,
      image: map['image'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PainelCardItemModel.fromJson(String source) => PainelCardItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
