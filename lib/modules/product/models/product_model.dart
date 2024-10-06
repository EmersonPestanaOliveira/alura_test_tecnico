import 'package:technical_project/core/imports_core.dart';

class Product extends Equatable {
  final int id;
  final int categoriaId;
  final String name;
  final double price;
  final String imagePath;

  const Product({
    required this.id,
    required this.categoriaId,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null || json['categoriaId'] == null) {
      throw ArgumentError(ApiErrorsMenssage.errorMissingFields);
    }

    return Product(
      id: json['id'] as int,
      categoriaId: json['categoriaId'] as int,
      name: (json['nome'] as String?)?.trim() ?? '',
      price: (json['preço'] as num?)?.toDouble() ?? 0.0,
      imagePath: (json['imagem'] as String?)?.trim() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoriaId': categoriaId,
      'nome': name,
      'preço': price,
      'imagem': imagePath,
    };
  }

  static List<Product> fromJsonList(List<dynamic>? jsonList) {
    if (jsonList == null) return [];
    return jsonList.map((json) {
      if (json is Map<String, dynamic>) {
        return Product.fromJson(json);
      } else {
        throw ArgumentError(ApiErrorsMenssage.errorInvalidJsonFormat);
      }
    }).toList();
  }

  @override
  List<Object?> get props => [id, categoriaId, name, price, imagePath];
}
