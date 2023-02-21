import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:food_delivery/data/models/cart_model.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/logic/controller/cart_controller.dart';
import 'package:food_delivery/logic/controller/recommented_product_controller.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/appicon.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';
import 'package:food_delivery/ui/routes/routes.dart';
import 'package:get/get.dart';

import '../../../logic/controller/popular_product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.0,
          // elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Container(
            padding: EdgeInsets.all(10.0),
            child: AppIcon(
                bgcolor: Colorpalatte.maincolor,
                iconcolor: Colors.white,
                icon: Icons.arrow_back_ios,
                onPressed: () {
                  Get.toNamed(RouterHelper.initial);
                  // Get.back();
                }),
          ),
          actions: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: AppIcon(
                  icon: Icons.home_outlined,
                  iconcolor: Colors.white,
                  bgcolor: Colorpalatte.maincolor,
                  onPressed: () {
                    Get.toNamed(
                      RouterHelper.getinitial(),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: AppIcon(
                  icon: Icons.add_shopping_cart,
                  iconcolor: Colors.white,
                  bgcolor: Colorpalatte.maincolor,
                  onPressed: () {}),
            )
          ],
        ),
        body: GetBuilder<CartController>(builder: (cartcontroller) {
          return ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(Diamentions.height5),
            itemCount: cartcontroller.cartlist.length,
            itemBuilder: (context, index) {
              final CartModel data = cartcontroller.cartlist[index];

              return GestureDetector(
                onTap: (() {
                  var popularindex = Get.find<PopularProductcontroller>()
                      .popularproductList
                      .indexOf(data.product!);
                  if (popularindex >= 0) {
                    Get.toNamed(RouterHelper.getpopularfood(popularindex,'cartpage'));
                  } else {
                    var recommendedindex =
                        Get.find<RecommendedProductcontroller>()
                            .recommendedproductList
                            .indexOf(data.product!);
                    Get.toNamed(RouterHelper.getRecomentedFood(recommendedindex,'cartpage'));
                  }
                }),
                child: Container(
                  margin: EdgeInsets.all(Diamentions.width15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Diamentions.radious20),
                    color: Color.fromARGB(255, 211, 209, 209),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: Diamentions.height20 * 6,
                        width: Diamentions.height50 * 2,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Diamentions.radious20),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          image: DecorationImage(
                              image: NetworkImage(
                                '${AppConstants.BASE_URL}/uploads/${data.img}',
                                // 'assets/images/homepage_image/img1.jpg',
                              ),
                              fit: BoxFit.cover),
                        ),
                        // child: Container(color: Colors.amber,width: 50.0,height: 50.0,),
                      ),
                      SizedBox(
                        width: Diamentions.height10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: data.name.toString()),
                            const SmallText(text: 'spicy'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(
                                  text: '\$ ${data.price.toString()}',
                                  color: Colors.redAccent,
                                  size: 20.0,
                                ),
                                Container(
                                  // height: Diamentions.height30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            Diamentions.radious10 * 2)),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          // popularProduct.setQauntity(false);
                                          cartcontroller.addItem(
                                              data.product!, -1);
                                        },
                                      ),
                                      BigText(
                                        text: data.quantity.toString(),
                                        size: 23.0,
                                        // popularProduct.cartitem.toString()
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          // popularProduct.setQauntity(true);
                                          cartcontroller.addItem(
                                              data.product!, 1);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
          return Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              height: Diamentions.height50 * 1.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Diamentions.radious20),
                    topRight: Radius.circular(Diamentions.radious20)),
                color: Colors.black12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Diamentions.height50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 234, 234),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Diamentions.radious10 * 2)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              
                              BigText(text: "\$ "+cartController.totalamount.toString()),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Diamentions.height30 * 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Diamentions.radious10 * 2),
                          ),
                          backgroundColor: Colorpalatte.maincolor,
                          foregroundColor:
                              const Color.fromARGB(255, 210, 210, 210),
                          // padding: EdgeInsets.all(15.0)),
                        ),
                        onPressed: () {
                          // popularProduct.addItem(product);
                        },
                        child:const SmallText(
                          text: 'Checkout',
                          size: 16.0,
                          color: const Color.fromARGB(255, 122, 120, 120),
                        )),
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
