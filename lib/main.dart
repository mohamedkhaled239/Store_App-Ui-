import 'package:app_store/screens/home_page.dart';
import 'package:app_store/screens/update_product_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => const HomePage(),
        UpdateProductPage.id : (context) => const UpdateProductPage(),
        
      },
      initialRoute: HomePage.id,
    );
  }
}