import 'package:bro_speak/presentation/auth/login.dart';
import 'package:bro_speak/presentation/main_screen/bottom_nav/bottom_nav.dart';
import 'package:bro_speak/presentation/main_screen/new_admin_form.dart';
import 'package:bro_speak/presentation/students/students_home.dart';
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatelessWidget {
  final String? id;
  SplashScreen({super.key, this.id});

  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 5));
      if (id == null) {
        final adminAccessToken = await storage.read(key: 'admin_access_token');
        final studentAccessToken = await storage.read(key: 'access_token');

        if (adminAccessToken != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavController(),
              ),
              (route) => false);
        } else if (studentAccessToken != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => StudentHomeScreen()),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
        }
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => NewAdminFormScreen(
                id: id,
              ),
            ),
            (route) => false);
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
        child: Scaffold(
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
