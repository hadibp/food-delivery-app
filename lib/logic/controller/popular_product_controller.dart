import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/data/repository/popularproduct_repository.dart';
import 'package:get/get.dart';

class PopularProductcontroller extends GetxController {
  final Popularproductrepo popularproductrepo;

  PopularProductcontroller({required this.popularproductrepo});

  List<dynamic> _popularproductList = [];
  List<dynamic> get popularproductList =>_popularproductList; 

  Future<dynamic> getPopularProdcutList() async {
    Response response = await popularproductrepo.getPopularProdcut();

    if (response.statusCode == 200) {
      print("got the product");
      _popularproductList=[];
      _popularproductList.addAll(PopularProduct.fromJson(response.body).products);
      print(_popularproductList);
      update();

    }else{

    }
  }
}
