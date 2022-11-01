import 'package:food_delivery/ui/screens/home/home.dart';
import 'package:food_delivery/ui/screens/popular_foodpage/popular_food_page.dart';
import 'package:food_delivery/ui/screens/popular_foodpage/recomentedfoodpage.dart';
import 'package:get/get.dart';

class RouterHelper {
  static const String initial = '/';
  static const String popularfoodpage = '/popular-foodpage';
  static const String recommededfoodpage = '/recommeded-foodpage';

  static String getinitial() => initial;
  static String getpopularfood(int pageId) => '$popularfoodpage?pageId=$pageId';
  static String getRecomentedFood(int pageId) =>
      '$recommededfoodpage?pageId=$pageId';

  static List<GetPage> route = [
    GetPage(
      name: initial,
      page: () => const Home(),
    ),
    GetPage(
        name: popularfoodpage,
        page: () {
          int pageId = int.parse(Get.parameters['pageId'].toString());
          return PopularFoodDetail(pageId: pageId);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommededfoodpage,
        page: () {
          int pageId = int.parse(Get.parameters['pageId'].toString());
          return RecomentedFoodpage(pageId:pageId);
        },
        transition: Transition.fadeIn)
  ];
}
