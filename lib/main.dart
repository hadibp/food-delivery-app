import 'package:flutter/material.dart';
import 'package:food_delivery/logic/controller/popular_product_controller.dart';
import 'package:food_delivery/logic/helper/dependacies.dart' as dep;
import 'package:food_delivery/ui/screens/home/home.dart';
import 'package:food_delivery/ui/screens/popular_foodpage/popular_food_page.dart';
import 'package:get/get.dart';

import 'ui/screens/popular_foodpage/recomentedfoodpage.dart';

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
    return const  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecomentedFoo(),
    );
  }
}