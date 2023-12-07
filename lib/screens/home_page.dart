import 'package:app_store/models/product_model.dart';
import 'package:app_store/screens/custom_card.dart';
import 'package:app_store/services/get_all_product_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                )),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "New Trend",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  List<ProductModel>products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) {
                return customCard(product: products[index],);
              });
                }
                else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ),
        );
  }
}
