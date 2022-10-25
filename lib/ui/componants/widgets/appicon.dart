
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bgcolor;
  final Color iconcolor;
  final double size;
  final VoidCallback onPressed;

  const AppIcon({
    Key? key,
    required this.icon,
    this.bgcolor =const Color.fromARGB(255, 255, 255, 255),
    this.iconcolor = const Color(0xFF756d54),
    this.size = 40.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: bgcolor),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconcolor,
          size: Diamentions.iconSize,
        ),
      ),
    );
  }
}