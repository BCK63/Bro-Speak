import 'package:bro_speak/presentation/auth/login.dart';
import 'package:bro_speak/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 5));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    });
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
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: BroSpeakLogo(),
        ));
  }
}
