import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: Text(
                'Bro',
                style: GoogleFonts.balooBhaijaan2(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const BoxShadow(
                        offset: Offset(3.0, 3.0),
                        color: Color.fromARGB(255, 39, 38, 38),
                        blurRadius: 5.0,
                        inset: true),
                    const BoxShadow(
                        offset: Offset(-3.0, -3.0),
                        color: Color.fromARGB(255, 103, 103, 103),
                        inset: true),
                  ],
                ),
              )),
              const Center(
                child: Text(
                  "---COMMUNICATE--",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
