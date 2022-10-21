

import 'package:flutter/material.dart';
import 'package:food_delivery/ui/componants/constants/constants.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/bigtext.dart';
import 'package:food_delivery/ui/componants/widgets/reusable_Icon_and_text.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';

class AppColumn extends StatelessWidget {
  final String bigtext;
  final double bigtextsize;
  final double smalltextsize;

  const AppColumn({
    Key? key, required this.bigtext,  this.bigtextsize = 24.0,this.smalltextsize = 16.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         BigText(
          text: bigtext,
          size: bigtextsize,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: Diamentions.height10,
        ),
        const SmallText(text: 'with some charachterstics'),
        SizedBox(
          height: Diamentions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            IconAndTextW(
                text: 'Normal',
                icon: Icons.circle_sharp,
                textsize: smalltextsize,
                iconColor: Colors.orangeAccent),
            IconAndTextW(
                icon: Icons.location_on,
                text: '1.7 Km',
                textsize: smalltextsize,
                iconColor: Colorpalatte.maincolor),
            IconAndTextW(
                icon: Icons.access_time_rounded,
                text: '34 min',
                textsize: smalltextsize,
                iconColor: Colors.orange)
          ],
        ),
      ],
    );
  }
}