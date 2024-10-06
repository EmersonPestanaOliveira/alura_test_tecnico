import 'package:technical_project/core/imports_core.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductCubit>()..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoryCubit>()..fetchCategories(),
        ),
      ],
      child: MaterialApp(
        title: 'Teste Técnico Alura',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home:  HomePage(),
      ),
    );
  }
}

