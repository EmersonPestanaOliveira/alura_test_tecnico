// Flutter Core e Pacotes Externos - Mantém os pacotes principais do Flutter e outros pacotes externos.
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart'; // Usado para gerenciamento de estado com blocos
export 'package:get_it/get_it.dart'; // Usado para injeção de dependências
export 'package:dio/dio.dart'; // Usado para requisições HTTP
export 'package:flutter_svg/svg.dart'; // Renderiza imagens SVG
export 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ícones adicionais

// Core do Projeto - Elementos centrais e reutilizáveis no projeto.
export 'package:technical_project/core/bloc_providers.dart'; // Configura blocos globais
export 'package:technical_project/services/service_locator.dart'; // Configura o localizador de serviços (DI)
export 'package:technical_project/core/app_boot_strap.dart'; // Inicialização da aplicação
export 'package:technical_project/styles/colors.dart'; // Paleta de cores global
export 'package:technical_project/constantes/api_constants.dart'; // Constantes de API

// Serviços - Camada de serviços do projeto.
export 'package:technical_project/services/api_service.dart'; // Serviço para chamadas de API

// Módulo de Categorias - Exporta todos os cubits, controllers, serviços, modelos e visões relacionados a categorias.
export 'package:technical_project/modules/category/cubits/category_cubit.dart';
export 'package:technical_project/modules/category/controllers/category_controller.dart';
export 'package:technical_project/modules/category/services/category_service.dart';
export 'package:technical_project/modules/category/models/category_model.dart';
export 'package:technical_project/modules/category/cubits/category_state.dart';
export 'package:technical_project/modules/category/views/category_screen/category_screen.dart';
export 'package:technical_project/modules/category/views/categories_section/categories_section.dart';
export 'package:technical_project/modules/category/views/category_item/category_item.dart';
export 'package:technical_project/modules/category/utils/category_constants.dart';
export 'package:technical_project/modules/category/utils/category_utils.dart';
export 'package:technical_project/modules/category/views/category_screen/category_screen_mixin.dart';
export 'package:technical_project/modules/category/views/category_item/category_item_mixin.dart';
export 'package:technical_project/modules/category/views/categories_section/categories_section_mixin.dart';

// Módulo de Produtos - Exporta todos os cubits, controllers, serviços, modelos e visões relacionados a produtos.
export 'package:technical_project/modules/product/cubits/product_cubit.dart';
export 'package:technical_project/modules/product/controllers/product_controller.dart';
export 'package:technical_project/modules/product/services/product_service.dart';
export 'package:technical_project/modules/product/models/product_model.dart';
export 'package:technical_project/modules/product/cubits/product_state.dart';
export 'package:technical_project/modules/product/views/product_screen/product_screen.dart';
export 'package:technical_project/modules/product/views/product_screen/product_screen_mixin.dart';
export 'package:technical_project/modules/product/views/promo_item/promo_item.dart';
export 'package:technical_project/modules/product/views/promo_item/promo_item_mixin.dart';
export 'package:technical_project/modules/product/views/promos_section/promos_section.dart';
export 'package:technical_project/modules/product/views/promos_section/promos_section_mixin.dart';

// Módulo de Descontos - Exporta a seção de descontos.
export 'package:technical_project/modules/discount/views/discount_section.dart';
export 'package:technical_project/modules/discount/views/discount_section_mixin.dart';

// Módulo de Informações - Exporta a seção de informações.
export 'package:technical_project/modules/infos/views/infos_section_mixin.dart';
export 'package:technical_project/modules/infos/views/infos_section.dart';

// Módulo Home - Exporta as visões e mixins relacionadas à home.
export 'package:technical_project/modules/home/views/home_page/home_page.dart';
export 'package:technical_project/modules/home/views/home_page/home_page_mixin.dart';
export 'package:technical_project/modules/home/views/custom_drawer/custom_drawer.dart';
export 'package:technical_project/modules/home/views/custom_drawer/custom_drawer_mixin.dart'; // Mixin para o drawer personalizado

// Utilitários e Strings - Exporta utilitários gerais e constantes de strings.
export 'package:technical_project/utils/string_utils.dart';
export 'package:technical_project/constantes/mensages_erros_constants.dart'; // Constantes de mensagens de erro

// Pacotes Dart - Pacotes internos do Dart.
export 'dart:convert'; // Para conversão de JSON
export 'dart:collection'; // Para estruturas de dados como listas

// Pacotes Externos - Outros pacotes externos utilizados no projeto.
export 'package:equatable/equatable.dart'; // Usado para comparar objetos, útil com blocos e cubits

// Estilos - Text Styles
export 'package:technical_project/styles/text_styles.dart'; // Estilos de texto
