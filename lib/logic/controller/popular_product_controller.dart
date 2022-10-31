import 'package:food_delivery/data/models/cart_model.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/data/repository/popularproduct_repository.dart';
import 'package:food_delivery/logic/controller/cart_controller.dart';
import 'package:get/get.dart';

class PopularProductcontroller extends GetxController {
  final Popularproductrepo popularproductrepo;

  PopularProductcontroller({required this.popularproductrepo});

  List<ProductModel> _popularproductList = [];
  List<ProductModel> get popularproductList => _popularproductList;
  late CartController _cart;

  bool _isLoaded = false;
  int _quantity = 0;
  bool get isLoaded => _isLoaded;
  int get quantity => _quantity;
  int _cartitem = 0;
  int get cartitem => _cartitem+quantity;

  Future<dynamic> getPopularProdcutList() async {
    Response response = await popularproductrepo.getPopularProdcut();

    if (response.statusCode == 200) {
      _popularproductList = [];
      _popularproductList
          .addAll(PopularProduct.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('data not fetched');
    }
  }

  void setQauntity(bool isIncremented) {
    if (isIncremented) {
      _quantity = checkQuatity(_quantity + 1);
    } else {
      _quantity = checkQuatity(_quantity - 1);
    }
    update();
  }

  int checkQuatity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        'Item count',
        "you can't reduce more",
      );
      return 0;
    } else if (quantity > 10) {
      Get.snackbar(
        'Item count',
        "you can't add more",
      );

      return 10;
    } else {
      return quantity;
    }
  }

  void initproduct(CartController cart){
    _quantity =0;
    _cartitem=0;
    _cart=cart;
  }
  void addItem(ProductModel productModel){
    _cart.addItem(productModel, _quantity);
  }
}
