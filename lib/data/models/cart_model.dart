class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExit;
  String? time;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExit,
      this.quantity,
      this.time});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    img = json['quantity'];
    time = json['time'];
    isExit = json['isExit'];
  }


}
