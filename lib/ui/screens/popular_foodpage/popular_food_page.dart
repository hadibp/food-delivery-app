import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';

class PopularFoodDetail extends StatelessWidget {
   const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.abc_rounded),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
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
                      image: AssetImage(
                        'assets/images/secound_page/img4.jpg',
                      ),
                      fit: BoxFit.cover,
                      ),
                ),
              )),
          Positioned(child: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined))
            ],
          )),
          
        ]),
      ),
    );
  }
}
