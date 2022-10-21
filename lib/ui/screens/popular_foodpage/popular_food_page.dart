import 'package:flutter/material.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/appcolumn.dart';
import 'package:food_delivery/ui/componants/widgets/appicon.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: Icon(Icons.abc_rounded),
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        //   centerTitle: true,
        // ),
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
          padding: EdgeInsets.all(30.0),
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Diamentions.radious20),
                topRight: Radius.circular(Diamentions.radious20)),
          color: Colors.amber,
          ),
          child:Row(
            children: [
              Container(
                height: 700.0,

                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(
               Radius.circular(Diamentions.radious20*2)
                ),),
                child: Row(
                  children: [
                    Icon(Icons.remove),
                    BigText(text: '0'),
                    Icon(Icons.add),

                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
