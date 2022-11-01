import 'package:flutter/material.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';

class IconAndTextW extends StatelessWidget {
  final IconData icon;
  final String text;
  final double textsize;
  final Color iconColor;

  const IconAndTextW(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,  this.textsize = 14.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
// size: 20.0,
          size: Diamentions.iconSize,
        ),
      //  const SizedBox(
      //     width: 4.0,
      //   ),
        SmallText(text: text,size:textsize),
        // SizedBox(width: 6.0,)
      ],
    );
  }
}
