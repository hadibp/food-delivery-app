import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/appicon.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/expandable_widget_text.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';

class RecomentedFoo extends StatelessWidget {
  const RecomentedFoo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: Diamentions.height20 * 4,
              title: Row(
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
                  ]),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20.0),
                  child: Container(
                      height: Diamentions.height20 * 2,
                      width: double.maxFinite,
                      decoration:const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          color: Colors.white),
                      child:const Center(child: BigText(text: 'Silver app bar')))),
              pinned: true,
              backgroundColor: Colors.amberAccent,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/secound_page/img4.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children:[
                  Container(
                    child:const ExpandableTextWidget(
                      text:
                          'first half haiwl hellow world is goping to ha najhahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw. secound half haiwl hellow world is secound half  goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,first half haiwl hellow world is goping to ha najhahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw. secound half haiwl hellow world is secound half  goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,first half haiwl hellow world is goping to ha najhahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw. secound half haiwl hellow world is secound half  goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,first half haiwl hellow world is goping to ha najhahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw. secound half haiwl hellow world is secound half  goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,goping to ha naja ha hahaahbbsdida dsijd jdskfs ffsdkjfhsbfpsfew eu rfuw,',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
         color: Colors.black12,
          padding: EdgeInsets.only(top:Diamentions.height10,bottom:Diamentions.height10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppIcon(icon: Icons.remove, onPressed: () {}),
                  BigText(text:'\$ 2.44 x 0 '),
                  AppIcon(icon: Icons.add, onPressed: () {}),
                ],
              ),
              SizedBox(height: 8.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: IconButton(icon:const Icon(Icons.favorite),onPressed: (){},),
                  ),
                  SizedBox(
                    height: Diamentions.height50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Diamentions.radious10 * 2),
                          ),
                          backgroundColor: Color.fromARGB(255, 63, 79, 77),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
