import 'package:technical_project/core/imports_core.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String imagePath;

  const Category({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      throw ArgumentError(ApiErrorsMenssage.errorMissingFields);
    }

    return Category(
      id: json['id'] as int,
      name: (json['nome'] as String?)?.trim() ?? '',
      imagePath: (json['imagem'] as String?)?.trim() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': name,
      'imagem': imagePath,
    };
  }

  static List<Category> fromJsonList(List<dynamic>? jsonList) {
    if (jsonList == null) return [];
    return jsonList.map((json) {
      if (json is Map<String, dynamic>) {
        return Category.fromJson(json);
      } else {
        throw ArgumentError(ApiErrorsMenssage.errorInvalidJsonFormat);
      }
    }).toList();
  }

  @override
  List<Object?> get props => [id, name, imagePath];
}
