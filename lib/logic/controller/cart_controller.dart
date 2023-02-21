import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/cart_model.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel productModel, int quantity) {
    var totalQuantity = 0;

    if (_items.containsKey(productModel.id)) {
      _items.update(
        productModel.id!,
        (value) {
          totalQuantity = value.quantity! + quantity;
          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            isExist: true,
            quantity: value.quantity! + quantity,
            time: DateTime.now().toString(),
            product: productModel,
          );
        },
      );
      if (totalQuantity <= 0) {
        _items.remove(productModel.id);
      } else {}
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          productModel.id!,
          () {
            return CartModel(
              id: productModel.id,
              name: productModel.name,
              price: productModel.price,
              img: productModel.img,
              isExist: true,
              quantity: quantity,
              time: DateTime.now().toString(),
              product: productModel,
            );
          },
        );
      } else {
        Get.snackbar('Item count', "you should atleast add an item in the cart",
            backgroundColor: Colorpalatte.maincolor, colorText: Colors.white);
      }
    }
    update();
  }

  bool existInCart(ProductModel productModel) =>
      _items.containsKey(productModel.id) ? true : false;

  int getQuantity(ProductModel productModel) {
    var quantity = 0;
    if (_items.containsKey(productModel.id)) {
      _items.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get cartlist {
    return _items.entries.map((e) => e.value).toList();
  }
  int get totalamount{
    var total = 0;
    _items.forEach((key, value) {
      total+=value.price!*value.quantity!;
     });


    return total;
  }

}
