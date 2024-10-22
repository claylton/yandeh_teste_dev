import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/database/product_database.dart';
import 'package:yandeh_teste_dev/models/sections_item_model.dart';

class SectionsController extends ValueNotifier<List<SectionsItemModel>> {
  final ProductDatabase database;
  List<SectionsItemModel> sections = [];

  SectionsController(this.database) : super([]);

  Future<void> loadSections(bool original) async {
    sections = await database.getSections(original: original);
    sections = sections.where((e) => e.products.isNotEmpty).toList();
    notifyListeners();
  }
}
