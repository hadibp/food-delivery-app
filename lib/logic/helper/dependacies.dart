import 'package:food_delivery/data/api/api_clint.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popularproduct_repository.dart';
import 'package:food_delivery/data/repository/recommeded_product_repo.dart';
import 'package:food_delivery/logic/controller/cart_controller.dart';
import 'package:food_delivery/logic/controller/popular_product_controller.dart';
import 'package:food_delivery/logic/controller/recommented_product_controller.dart';
import 'package:get/get.dart';

Future<void> init() async{

  // api client
  Get.lazyPut(() => ApiClients(appBaseUrl: AppConstants.BASE_URL));

  // api repo
  Get.lazyPut(() => Popularproductrepo(apiClients: Get.find()));
  Get.lazyPut(() =>Recomendedproductrepo(apiClients: Get.find()));
  Get.lazyPut(() =>CartRepo());

  //controllers
  Get.lazyPut(() => PopularProductcontroller(popularproductrepo: Get.find()));
  Get.lazyPut(() => RecommendedProductcontroller(recomendedproductrepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}