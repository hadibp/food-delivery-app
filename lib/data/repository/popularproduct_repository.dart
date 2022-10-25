import 'package:food_delivery/data/api/api_clint.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:get/get.dart';

class Popularproductrepo extends GetxService{
  final ApiClients apiClients;

  Popularproductrepo({required this.apiClients});

  Future<Response> getPopularProdcut() async{
    return await apiClients.getdata(AppConstants.POPULAR_PRODUCT_URL);
  } 
}