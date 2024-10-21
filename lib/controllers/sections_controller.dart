import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';

class SectionsController {
  final Dio dio;
  final List<Color> pallet;

  SectionsController({
    required this.dio,
    required this.pallet,
  });

  Future<List<SectionsItemModel>> getSections({bool original = false}) async {
    Response response = await dio.get(
      'https://gateway-smartforce.yandeh.com.br/process/candidates/search-products',
      queryParameters: {
        'argument': '*',
        'original': original,
      },
      options: Options(
        headers: {
          'token': 'ec02009a-d78b-4a43-9fa7-77cff7b99673',
        },
      ),
    );
    try {
      return List<dynamic>.from(response.data['sections'])
          .asMap()
          .map((i, e) => MapEntry(
              i, SectionsItemModel.fromMap(e, pallet[i % pallet.length])))
          .values
          .toList();
    } on Exception catch (_) {
      return [];
    }
  }
}
