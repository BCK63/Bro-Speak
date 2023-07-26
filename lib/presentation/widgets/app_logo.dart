import 'package:bro_speak/core/size.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BroSpeakLogo extends StatefulWidget {
  const BroSpeakLogo({
    this.changableHeight,
    this.changableWidth,
    this.subtitleSize,this.titleSize,this.firstSpace,this.secondSpace,
    super.key,
  });

  final double? changableHeight;
  final double? changableWidth;
  final double? titleSize;
  final double? subtitleSize;
  final double? firstSpace;
  final double? secondSpace;

  @override
  State<BroSpeakLogo> createState() => _BroSpeakLogoState();
}

class _BroSpeakLogoState extends State<BroSpeakLogo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              height: widget.changableHeight!.h,
              width: widget.changableWidth!.w,
              child:  Text(
                "BRO",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: widget.titleSize,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    shadows:const [
                      BoxShadow(
                          offset: Offset(3.0, 3.0),
                          color: Color.fromARGB(255, 156, 156, 156),
                          blurRadius: 5.0,
                          inset: true),
                    ]),
              ),
            ),
            kWidth(widget.firstSpace!),
             Text(
              'SPEAK',
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.titleSize,
                fontWeight: FontWeight.bold,
                shadows:const [
                  BoxShadow(
                      offset: Offset(3.0, 3.0),
                      color: Color.fromARGB(255, 61, 61, 61),
                      blurRadius: 5.0,
                      inset: true),
                ],
              ),
            ),
          ],
        )),
        kHeight(widget.secondSpace!),
         Center(
          child: Text(
            "UNLOCKING CONVERSATION EVERYWHERE",
            style: TextStyle(
                fontSize: widget.subtitleSize, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
