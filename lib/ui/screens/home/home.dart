import 'package:flutter/material.dart';

import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';
import 'package:food_delivery/ui/screens/home/homepagebody.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 70.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Column(
            children: const [
              BigText(
                text: 'India',
                color: Colorpalatte.maincolor,
              ),
              SmallText(
                text: 'City',
                color: Colors.black54,
              )
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(Diamentions.font15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Diamentions.radious10),
                color: Colorpalatte.maincolor,
              ),
              width: Diamentions.height50,
              child: const Icon(
                Icons.search_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: const SizedBox(
          height: 900.0,
          child: SingleChildScrollView(child: HomePageBody()),
        ),
      ),
    );
  }
}
