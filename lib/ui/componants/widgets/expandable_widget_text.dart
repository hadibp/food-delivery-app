import 'package:flutter/material.dart';
import 'package:food_delivery/ui/componants/constants/diamention.dart';
import 'package:food_delivery/ui/componants/widgets/smalltext.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firsthalf;
  late String secoundhalf;
  bool hiddentext = true;
  double textheight = Diamentions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      firsthalf = widget.text.substring(0, textheight.toInt());
      secoundhalf =
          widget.text.substring(textheight.toInt() +1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secoundhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:10.0,right: 10.0,top: 10.0,bottom: 30.0),
      child: secoundhalf.isEmpty
          ? SmallText(text: firsthalf)
          : Column(
              children: [
                Text(
                    hiddentext
                        ? "$firsthalf ... "
                        : firsthalf + secoundhalf,),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        hiddentext ? "read more" : "read less",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;
                    });
                  },
                ),

              ],
            ),
    );
  }
}
