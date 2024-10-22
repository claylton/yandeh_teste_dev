import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';

class ProductDatabase {
  Future<List<SectionsItemModel>> getSections({bool original = false}) async {
    final Dio dio = Dio();

    final List<Color> pallet = [
      const Color(0xFF007C61),
      const Color(0xFFED1C24),
      const Color(0xFF35A88F),
      const Color(0xFF7BBD1B),
      const Color(0xFFEB7A7E),
    ];

    Response response = await dio.get(
      'https://gateway-smartforce.yandeh.com.br/process/candidates/search-products',
      queryParameters: original == true
          ? {
              'argument': '*',
              'original': original,
            }
          : {
              'argument': '*',
            },
      options: Options(
        headers: {
          'token': 'ec02009a-d78b-4a43-9fa7-77cff7b99673',
        },
      ),
    );
    try {
      return List<dynamic>.from(response.data['sections']).asMap().map((i, e) => MapEntry(i, SectionsItemModel.fromMap(e, pallet[i % pallet.length]))).values.toList();
    } on Exception catch (_) {
      return [];
    }
  }
}
