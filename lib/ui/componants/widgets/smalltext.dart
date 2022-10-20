import 'package:flutter/cupertino.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';

class SmallText extends StatelessWidget {
 const SmallText({
    super.key,
    this.color =const Color.fromARGB(255, 151, 148, 148),
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
    required this.text,
  });
  final String text;
  final Color color;
  final double size;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: size==0? Diamentions.font15 : size,
        color: color,
        fontFamily: 'Futura',
        fontStyle: FontStyle.italic,
        
        
      ),
    );
  }
}
