import 'package:app_store/helper/api.dart';
import 'package:app_store/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesServices(
      {required String categoryname}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryname');
    List<ProductModel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(ProductModel.fromJson(data[i]));
    }
    return productlist;
  }
}
