import 'package:food_delivery/data/models/popularProductmodel.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    img = json['quantity'];
    time = json['time'];
    isExist = json['isExit'];
    product = ProductModel.fromJson(json['product']);
  }
}
