import 'package:flutter/material.dart';
import 'package:food_delivery/logic/controller/popular_product_controller.dart';
import 'package:food_delivery/logic/controller/recommented_product_controller.dart';
import 'package:food_delivery/logic/helper/dependacies.dart' as dep;
import 'package:food_delivery/ui/routes/routes.dart';
import 'package:food_delivery/ui/screens/home/home.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductcontroller>().getPopularProdcutList();
    Get.find<RecommendedProductcontroller>().getRecommendedProdcutList();
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouterHelper.initial,
      getPages: RouterHelper.route,
      home:const Home(),
    );
  }
}
