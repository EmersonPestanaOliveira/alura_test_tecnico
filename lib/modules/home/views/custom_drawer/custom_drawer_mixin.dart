import 'package:technical_project/core/imports_core.dart';

mixin CustomDrawerMixin {
  // Informações do usuário
  static const String accountName = 'Emerson Pestana Oliveira';
  static const String accountEmail = 'emersonpestana.o@gmail.com';
  static const String userImagePath = 'assets/images/pacman_decoration.png';
  static const String backgroundHeaderImagePath = 'assets/images/pacman_decoration.png';


  // Estilo do Drawer Header
  static const double userImageBorderRadius = 75.0;
  static const double userImageShadowSpreadRadius = 5.0;
  static const double userImageShadowBlurRadius = 10.0;
  static const double userImageShadowOffsetY = 5.0;

  // Dimensões do ícone
  static const double drawerIconWidth = 50.0;
  static const double drawerIconHeight = 50.0;

  // Sombra do ícone
  static const Color drawerIconShadowColor = Colors.black;
  static const double drawerIconShadowOpacity = 0.2;

  // Categorias e seus detalhes
  static const String category1Title = 'Roupas';
  static const String category1ImagePath = 'assets/images/mario_tshirt.png';
  static const int category1Id = 1;

  static const String category2Title = 'Decoração';
  static const String category2ImagePath = 'assets/images/pacman_decoration.png';
  static const int category2Id = 2;

  static const String category3Title = 'Canecas';
  static const String category3ImagePath = 'assets/images/baby_yoda.png';
  static const int category3Id = 3;
}
