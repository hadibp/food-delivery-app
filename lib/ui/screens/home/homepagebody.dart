import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/constants/apiConstants.dart';
import 'package:food_delivery/data/models/popularProductmodel.dart';
import 'package:food_delivery/logic/controller/popular_product_controller.dart';
import 'package:food_delivery/logic/controller/recommented_product_controller.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/appcolumn.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/reusable_Icon_and_text.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';
import 'package:food_delivery/ui/routes/routes.dart';
import 'package:get/get.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currentpage = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Diamentions.pageViewContainer;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentpage = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //hight = 781
    /// width = 392
    return Column(
      children: [
        GetBuilder<PopularProductcontroller>(builder: (popularproducts) {
          return popularproducts.isLoaded
              ? Container(
                  height: Diamentions.pageViewContainer,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularproducts.popularproductList.length,
                      itemBuilder: (context, position) {
                        return _buildpage(position,
                            popularproducts.popularproductList[position]);
                      }),
                )
              : const CircularProgressIndicator();
        }),
        GetBuilder<PopularProductcontroller>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularproductList.isEmpty
                ? 2
                : popularProducts.popularproductList.length,
            position: _currentpage,
            decorator: DotsDecorator(
              activeColor: Colorpalatte.maincolor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Diamentions.height10,
        ),
        Container(
          margin: EdgeInsets.only(
              left: Diamentions.width15, bottom: Diamentions.height10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recomended'),
              SizedBox(
                width: Diamentions.width15,
              ),
              const BigText(
                text: '.',
                color: Colors.black26,
              ),
              SizedBox(
                width: Diamentions.width15,
              ),
              const SmallText(text: 'Food pairing')
            ],
          ),
        ),
        GetBuilder<RecommendedProductcontroller>(builder: (recomendedproduct) {
          return recomendedproduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(Diamentions.height5),
                  itemCount: recomendedproduct.recommendedproductList.length,
                  itemBuilder: (context, index) {
                    ProductModel data =
                        recomendedproduct.recommendedproductList[index];
                    return GestureDetector(
                      onTap: (() {
                        Get.toNamed(RouterHelper.getRecomentedFood(index));
                      }),
                      child: Container(
                        margin: EdgeInsets.all(Diamentions.width15),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Diamentions.radious20),
                          color: const Color.fromARGB(255, 241, 241, 241),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Diamentions.radious20),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      '${AppConstants.BASE_URL}/uploads/${data.img.toString()}',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: Diamentions.height10,
                            ),
                            Expanded(
                              child: AppColumn(
                                bigtext: data.name.toString(),
                                description: data.description.toString(),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const CircularProgressIndicator();
        })
      ],
    );
  }

  Widget _buildpage(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentpage.floor()) {
      var currentScale = 1 - (_currentpage - index) * (1 - _scaleFactor);
      var currTens = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTens, 0);
    } else if (index == _currentpage.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentpage - index + 1) * (1 - _scaleFactor);
      var currTens = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTens, 0);
    } else if (index == _currentpage.floor() - 1) {
      var currentScale = 1 - (_currentpage - index) * (1 - _scaleFactor);

      var currTens = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTens, 0);
    } else {
      var carrScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, carrScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 2);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              
              Get.toNamed(RouterHelper.getpopularfood(index));
            },
            child: Container(
              height: Diamentions.pageImageContainer,
              margin: EdgeInsets.only(
                  right: Diamentions.height20, top: Diamentions.width18),
              decoration: BoxDecoration(
                  color: index.isOdd ? Colors.blueAccent : Colors.amberAccent,
                  borderRadius: BorderRadius.circular(Diamentions.radious20),
                  image: DecorationImage(
                      image: NetworkImage(
                        '${AppConstants.BASE_URL}/uploads/${popularProduct.img}',
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Diamentions.pageViewTextContainer,
              margin: EdgeInsets.only(
                right: Diamentions.width30,
                bottom: Diamentions.height30,
                left: Diamentions.width18,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Diamentions.radious20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(
                        color: Colors.white,
                        // blurRadius: 5.0,-
                        offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                height: Diamentions.pageViewContainer,
                padding: EdgeInsets.only(left: Diamentions.width15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: popularProduct.name.toString(),
                        size: 23.0,
                      ),
                      SizedBox(
                        height: Diamentions.height5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Wrap(
                            children: List.generate(
                              4,
                              (index) => Icon(
                                Icons.star,
                                size: Diamentions.height20,
                                color: Colorpalatte.maincolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const SmallText(text: '4.5'),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const SmallText(text: '1287'),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const SmallText(text: 'Comments')
                        ],
                      ),
                      SizedBox(height: Diamentions.height10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            IconAndTextW(
                                text: 'Normal',
                                icon: Icons.circle_sharp,
                                iconColor: Colors.orangeAccent),
                            IconAndTextW(
                                icon: Icons.location_on,
                                text: '1.7 Km',
                                iconColor: Colorpalatte.maincolor),
                            IconAndTextW(
                                icon: Icons.access_time_rounded,
                                text: '34 min',
                                iconColor: Colors.orange)
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
