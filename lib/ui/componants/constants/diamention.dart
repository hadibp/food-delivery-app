import 'package:get/get.dart';

class Diamentions {
  /// height = 781
  /// width = 392

  //hieght and width of device
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //heights of pageviewa
  static double pageView = screenHeight / 2.05;
  static double pageViewContainer = screenHeight / 2.78;
  static double pageImageContainer = screenHeight / 4.33;
  static double pageViewTextContainer = screenHeight / 6.50;

  // heights of widgets
  static double height5 = screenHeight / 156.2;
  static double height10 = screenHeight / 78.1;
  static double height20 = screenHeight / 39.05;
  static double height30 = screenHeight / 26.03;
  static double height50 = screenHeight / 15.62;

  //dynamic width and height
  static double width15 = screenWidth / 26.1;
  static double width18 = screenWidth / 21.7;
  static double width30 = screenWidth / 13.0;

  // font size
  static double font15 = screenHeight / 52.0;
  static double font25 = screenHeight / 31.24;

//icons size
  static double iconSize = screenHeight / 39.05;

  //radious
  static double radious10 = screenHeight / 78.1;
  static double radious20 = screenHeight / 39.05;

  //popular food page
  static double foodpageImageheight = screenHeight / 2.23;
}
