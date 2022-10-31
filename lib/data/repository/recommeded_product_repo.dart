import 'package:food_delivery/data/api/api_clint.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:get/get.dart';

class Recomendedproductrepo extends GetxService{
  final ApiClients apiClients;

  Recomendedproductrepo({required this.apiClients});

  Future<Response> getRecommendedProdcutList() async{
    return await apiClients.getdata(AppConstants.RECOUMENDED_PRODUCT_URL);
  } 
}