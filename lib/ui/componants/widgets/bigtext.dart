import 'package:flutter/material.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';

class BigText extends StatelessWidget {
 const BigText({
    super.key,
    this.color= Colors.black54,
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
    required this.text,
  });
  final String text;
  final Color color ;
  final double size;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: size==0?Diamentions.font25:size,
        color: color,
        fontFamily: 'Futura',
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
