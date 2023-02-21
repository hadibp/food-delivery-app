import 'package:food_delivery/ui/screens/cart/cart_page.dart';
import 'package:food_delivery/ui/screens/home/home.dart';
import 'package:food_delivery/ui/screens/popular_foodpage/popular_food_page.dart';
import 'package:food_delivery/ui/screens/popular_foodpage/recomentedfoodpage.dart';
import 'package:get/get.dart';

class RouterHelper {
  static const String initial = '/';
  static const String popularfoodpage = '/popular-foodpage';
  static const String recommededfoodpage = '/recommeded-foodpage';
  static const String cartpage = '/cart-page';

  static String getinitial() => initial;
  static String getpopularfood(int pageId,String page) => '$popularfoodpage?pageId=$pageId&page=$page';
  static String getRecomentedFood(int pageId,String page) => '$recommededfoodpage?pageId=$pageId&page=$page';
  static String getCartpage() => cartpage;

  static List<GetPage> route = [
    GetPage(
      name: initial,
      page: () => const Home(),
    ),
    GetPage(
      name: popularfoodpage,
      page: () {
        int pageId = int.parse(Get.parameters['pageId'].toString());
        String page = Get.parameters['page'].toString();
        return PopularFoodDetail(pageId: pageId,page: page,);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommededfoodpage,
      page: () {
        int pageId = int.parse(Get.parameters['pageId'].toString());
        String page = Get.parameters['page'].toString();

        return RecomentedFoodpage(pageId: pageId,page:page);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartpage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
