import 'package:bro_speak/core/size.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 50, 49, 54),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
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
                    height: 50.h,
                    width: 110.w,
                    child: const Text(
                      "BRO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          shadows: [
                            BoxShadow(
                                offset: Offset(3.0, 3.0),
                                color: Color.fromARGB(255, 156, 156, 156),
                                blurRadius: 5.0,
                                inset: true),
                          ]),
                    ),
                  ),
                  kWidth(5),
                  const Text(
                    'SPEAK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                            offset: Offset(3.0, 3.0),
                            color: Color.fromARGB(255, 61, 61, 61),
                            blurRadius: 5.0,
                            inset: true),
                        // const BoxShadow(
                        //     spreadRadius: 3,
                        //     offset: Offset(-3.0, -3.0),
                        //     color: Color.fromARGB(255, 207, 207, 207),
                        //     inset: true),
                      ],
                    ),
                  ),
                ],
              )),
              kHeight(10),
              const Center(
                child: Text(
                  "--------------COMMUNICATE--------------",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
