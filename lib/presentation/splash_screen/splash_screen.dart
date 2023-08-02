import 'package:bro_speak/application/provider/dynamiclinks_provider.dart';
import 'package:bro_speak/presentation/auth/login.dart';
import 'package:bro_speak/presentation/main_screen/bottom_nav/bottom_nav.dart';
import 'package:bro_speak/presentation/students/students_home.dart';
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 4));
      final adminAccessToken = await storage.read(key: 'admin_access_token');
      final studentAccessToken = await storage.read(key: 'access_token');
      if (Provider.of<DynamicLinksssProvider>(context, listen: false)
              .isEnteredThroughDynamicLinks ==
          false) {
        if (adminAccessToken != null && mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavController(
                  comingFron: 'splashScreen bro!',
                ),
              ),
              (route) => false);
        } else if (studentAccessToken != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentHomeScreen(),
              ),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false);
        }
      }
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
          body: BroSpeakLogo(
            changableHeight: 50,
            changableWidth: 110,
            firstSpace: 5,
            secondSpace: 8,
            subtitleSize: 15,
            titleSize: 50,
          ),
        ));
  }
}
