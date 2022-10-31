import 'package:flutter/material.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/logic/controller/cart_controller.dart';
import 'package:food_delivery/logic/controller/popular_product_controller.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/appcolumn.dart';
import 'package:food_delivery/ui/componants/widgets/appicon.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/expandable_widget_text.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';
import 'package:food_delivery/ui/routes/routes.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductcontroller>().popularproductList[pageId];
        Get.find<PopularProductcontroller>().initproduct(Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: Diamentions.foodpageImageheight,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${AppConstants.BASE_URL}/uploads/${product.img}',
                    ),
                  ),
                ),
              )),
          Positioned(
              left: Diamentions.width18,
              right: Diamentions.width18,
              top: Diamentions.height20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    onPressed: (() {
                      Get.toNamed(RouterHelper.getinitial());
                      // Navigator.pop(context);
                    }),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    onPressed: (() {}),
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: Diamentions.foodpageImageheight - 30,
            child: Container(
              height: Diamentions.height320,
              padding: EdgeInsets.only(
                top: Diamentions.width18,
                left: Diamentions.width18,
                right: Diamentions.width18,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Diamentions.radious20),
                      topRight: Radius.circular(Diamentions.radious20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    bigtext: product.name.toString(),
                    description: product.location.toString(),
                  ),
                  SizedBox(
                    height: Diamentions.height20,
                  ),
                  const BigText(text: "introduce"),
                  SizedBox(
                    height: Diamentions.height10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.description.toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
        bottomNavigationBar: GetBuilder<PopularProductcontroller>(
          builder: (popularProduct) {
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
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Diamentions.radious10 * 2)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    popularProduct.setQauntity(false);
                                  },
                                ),
                                 BigText(text: popularProduct.quantity.toString()),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    popularProduct.setQauntity(true);

                                  },
                                ),
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
                              borderRadius:
                                  BorderRadius.circular(Diamentions.radious10 * 2),
                            ),
                            backgroundColor: Colorpalatte.maincolor,
                            foregroundColor: Color.fromARGB(255, 210, 210, 210),
                            // padding: EdgeInsets.all(15.0)),
                          ),
                          onPressed: () {
                            popularProduct.addItem(product);
                          },
                          child: SmallText(
                            text: '\$ ${product.price} | Add to cart',
                            size: 16.0,
                            color: Color.fromARGB(255, 122, 120, 120),
                          )),
                    ),
                  ],
                ));
          }
        ),
      ),
    );
  }
}
