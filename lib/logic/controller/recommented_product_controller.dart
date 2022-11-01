import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/data/repository/recommeded_product_repo.dart';
import 'package:get/get.dart';

class RecommendedProductcontroller extends GetxController {
  final Recomendedproductrepo recomendedproductrepo;

  RecommendedProductcontroller({required this.recomendedproductrepo});

  List<dynamic> _recommendedproductList = [];
  List<dynamic> get recommendedproductList =>_recommendedproductList; 

  bool _isLoaded=false;
  bool get isLoaded => _isLoaded;

  Future<dynamic> getRecommendedProdcutList() async {
    Response response = await recomendedproductrepo.getRecommendedProdcutList();

    if (response.statusCode == 200) {
      _recommendedproductList=[];
      _recommendedproductList.addAll(PopularProduct.fromJson(response.body).products);
      _isLoaded=true;
      update();

    }else{
      print("didnt the recommended product");

    }
  }
}
