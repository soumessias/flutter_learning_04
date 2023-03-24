import 'package:app_04/pages/product_detail_page.dart';
import 'package:app_04/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'pages/products_overview_page.dart';
import 'models/product_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, //To remove DEBUG banner
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'RepublicaMinor',
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
        },
      ),
    );
  }
}
