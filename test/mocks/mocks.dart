import 'package:mockito/annotations.dart';
import 'package:technical_project/modules/category/controllers/category_controller.dart';
import 'package:technical_project/modules/category/cubits/category_cubit.dart';
import 'package:technical_project/modules/category/services/category_service.dart';
import 'package:technical_project/modules/product/controllers/product_controller.dart';
import 'package:technical_project/modules/product/cubits/product_cubit.dart';
import 'package:technical_project/modules/product/services/product_service.dart';
import 'package:technical_project/services/api_service.dart';

@GenerateMocks([
  ApiService, 
  CategoryService, 
  ProductService, 
  CategoryController, 
  ProductController, 
  CategoryCubit, 
  ProductCubit
])
void main() {}
