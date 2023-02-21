import 'package:flutter/material.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/logic/controller/cart_controller.dart';
import 'package:food_delivery/logic/controller/popular_product_controller.dart';
import 'package:food_delivery/logic/controller/recommented_product_controller.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/appicon.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/expandable_widget_text.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';
import 'package:food_delivery/ui/routes/routes.dart';
import 'package:get/get.dart';

class RecomentedFoodpage extends StatelessWidget {
  final int pageId;
  final String page;
  const RecomentedFoodpage(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        Get.find<RecommendedProductcontroller>().recommendedproductList[pageId];
    Get.find<PopularProductcontroller>()
        .initproduct(product, Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Diamentions.height20 * 4,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    onPressed: (() {
                      // Get.toNamed(RouterHelper.getinitial());
                      if (page == 'cartpage') {
                        Get.toNamed(RouterHelper.getCartpage());
                      } else {
                        Get.toNamed(RouterHelper.getinitial());
                      }
                    }),
                  ),
                  GetBuilder<PopularProductcontroller>(
                      builder: (popularProductcontroller) {
                    return Stack(children: [
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        onPressed: (() {
                          Get.toNamed(RouterHelper.getCartpage());
                        }),
                      ),
                      Get.find<PopularProductcontroller>().totalItems >= 1
                          ? Positioned(
                              right: 5,
                              top: 5,
                              child: Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colorpalatte.maincolor,
                                ),
                                child: Center(
                                    child: BigText(
                                  text: Get.find<PopularProductcontroller>()
                                      .totalItems
                                      .toString(),
                                  size: 11.0,
                                  color: Colors.white,
                                )),
                              ),
                            )
                          : Container(),
                    ]);
                  }),
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(20.0),
                  child: Container(
                      height: Diamentions.height20 * 2,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          color: Colors.white),
                      child: Center(
                          child: BigText(text: product.name.toString())))),
              pinned: true,
              backgroundColor: Colors.amberAccent,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  '${AppConstants.BASE_URL}/uploads/${product.img}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(
                      text: product.description.toString(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductcontroller>(
            builder: (popularProductcontroller) {
          return Container(
            color: Color.fromARGB(31, 205, 201, 201),
            padding: EdgeInsets.only(
                top: Diamentions.height10, bottom: Diamentions.height10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppIcon(
                        icon: Icons.remove,
                        onPressed: () {
                          popularProductcontroller.setQauntity(false);
                        }),
                    BigText(
                        text:
                            '\$ ${product.price} x ${popularProductcontroller.cartitem} '),
                    AppIcon(
                        icon: Icons.add,
                        onPressed: () {
                          popularProductcontroller.setQauntity(true);
                        }),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: Diamentions.height50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Diamentions.radious10 * 2),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 63, 79, 77),
                            foregroundColor:
                                const Color.fromARGB(255, 210, 210, 210),
                            // padding: EdgeInsets.all(15.0)),
                          ),
                          onPressed: () {
                            popularProductcontroller.addItem(product);
                          },
                          child: SmallText(
                            text: '\$ ${product.price} | Add to carts',
                            size: 16.0,
                            color: Colors.white,
                          )),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
