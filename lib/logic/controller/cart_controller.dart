import 'package:food_delivery/data/models/cart_model.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  void addItem(ProductModel productModel, int quantity) {
    print(_items);
    _items.putIfAbsent(
      productModel.id!,
      () {
        print('adding item to the cart ${productModel.id} + $quantity');
        return CartModel(
          id: productModel.id,
          name: productModel.name,
          price: productModel.price,
          img: productModel.img,
          isExit: true,
          quantity: quantity,
          time: DateTime.now().toString(),
        );
      },
    );
  }
}
