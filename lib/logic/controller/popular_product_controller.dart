import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/data/repository/popularproduct_repository.dart';
import 'package:food_delivery/logic/controller/cart_controller.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
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
  int _incartitem = 0;
  int get cartitem => _incartitem + _quantity;

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
    if ((_incartitem + quantity) < 0) {
      Get.snackbar(
        'Item count',
        "you can't reduce more",
      );
      return 0;
    } else if ((_incartitem + quantity) > 10) {
      Get.snackbar(
        'Item count',
        "you can't add more",
      );

      return 10;
    } else {
      return quantity;
    }
  }

  void initproduct(ProductModel productModel, CartController cart) {
    _quantity = 0;
    _incartitem = 0;
    _cart = cart;
    var existIn = false;
    existIn = _cart.existInCart(productModel);
    if (existIn) {
      _incartitem = _cart.getQuantity(productModel);
    }
    print("$_incartitem cart items in  cart");
  }

  void addItem(ProductModel productModel) {
    _cart.addItem(productModel, _quantity);
    _quantity = 0;
    _incartitem = _cart.getQuantity(productModel);
    _cart.items.forEach((key, value) {
      print("the id is ${value.id} and total quantity is ${value.quantity}");
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
