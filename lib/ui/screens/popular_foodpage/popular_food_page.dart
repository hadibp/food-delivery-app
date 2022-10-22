import 'package:flutter/material.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/appcolumn.dart';
import 'package:food_delivery/ui/componants/widgets/appicon.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: Diamentions.foodpageImageheight,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/secound_page/img4.jpg',
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
                    onPressed: (() {}),
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
              padding: EdgeInsets.all(Diamentions.width18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Diamentions.radious20),
                      topRight: Radius.circular(Diamentions.radious20)),
                  color: Colors.redAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(
                    bigtext: "Biriyani",
                  ),
                  SizedBox(
                    height: Diamentions.height20,
                  ),
                  const BigText(text: "introduce")
                ],
              ),
            ),
          ),
        ]),
        bottomNavigationBar: Container(
            padding:const EdgeInsets.only(left: 30.0, right: 30.0),
            height: Diamentions.height50*2,
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
                  padding: EdgeInsets.only(
                      left: Diamentions.height10,
                      bottom: Diamentions.height10,
                      top: Diamentions.height10,
                      right: Diamentions.height10),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(
                        Radius.circular(Diamentions.radious10 * 2)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        height: 150.0,
                        child: Row(
                          children: [
                            const Icon(Icons.remove),
                            SizedBox(width: Diamentions.width5),
                            const BigText(text: '0'),
                            SizedBox(width: Diamentions.width5),
                            const Icon(Icons.add),
                            SizedBox(width: Diamentions.width5),
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
                      onPressed: () {},
                      child: const SmallText(
                        text: '\$10 | Add to cart',
                        size: 16.0,
                        color: Colors.white,
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
