// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductCardItemModel {
  final int id;
  final String name;
  final String sku;
  final String category;
  final String package;
  final String ean;
  final double unitContent;
  final String unitMeasure;
  final int packageQuantity;
  final double price;

  ProductCardItemModel({
    required this.id,
    required this.name,
    required this.sku,
    required this.category,
    required this.package,
    required this.ean,
    required this.unitContent,
    required this.unitMeasure,
    required this.packageQuantity,
    required this.price,
  });

  factory ProductCardItemModel.placeholder() {
    return ProductCardItemModel(
      id: 0,
      name: "NOZES BENASSI SEM CASCA POTE 100 G",
      sku: "000000",
      category: "APERITIVOS E OLEAGINOSAS A GRANEL",
      package: "UNIDADE",
      ean: "0000000000000",
      unitContent: 100.0,
      unitMeasure: "G",
      packageQuantity: 0,
      price: 2.13,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sku': sku,
      'category': category,
      'package': package,
      'ean': ean,
      'unitContent': unitContent,
      'unitMeasure': unitMeasure,
      'packageQuantity': packageQuantity,
      'price': price,
    };
  }

  factory ProductCardItemModel.fromMap(Map<String, dynamic> map) {
    return ProductCardItemModel(
      id: map['id'] as int,
      name: map['name'] as String,
      sku: map['sku'] as String,
      category: map['category'] as String,
      package: map['package'] as String,
      ean: map['ean'] as String,
      unitContent: map['unitContent'] as double,
      unitMeasure: map['unitMeasure'] as String,
      packageQuantity: map['packageQuantity'] as int,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCardItemModel.fromJson(String source) =>
      ProductCardItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
