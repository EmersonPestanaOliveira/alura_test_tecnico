import 'package:technical_project/core/imports_core.dart';

mixin CategoriesSectionMixin {
  // Espaçamentos e tamanhos
  static const double sectionSpacing = 20.0;
  static const double titleFontSize = 24.0;
  static const double descriptionFontSize = 16.0;
  static const double categoryItemSpacing = 12.0;
  static const double smallSpacing = 8.0;
  static const EdgeInsets sectionPadding = EdgeInsets.all(16.0);

  // Textos
  static const String titleText = 'Categorias';
  static const String descriptionText = 'De roupas a gadgets tecnológicos temos tudo para atender suas paixões e hobbies com estilo e autenticidade.';
  static const String noCategoriesText = 'Nenhuma categoria disponível.';
  static const String errorText = 'Ocorreu um erro ao carregar categorias.';
}