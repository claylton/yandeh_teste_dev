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
      name: map['name'].toString(),
      sku: map['sku'].toString(),
      category: map['category'].toString(),
      package: map['package'].toString(),
      ean: map['ean'].toString(),
      unitContent: map['unitContent'] as double,
      unitMeasure: map['unitMessure'].toString(),
      packageQuantity: map['packageQuantity'] as int,
      price: double.tryParse(map['price']) ?? 0,
    );
  }
}
