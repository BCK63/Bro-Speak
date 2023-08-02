
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 4));
         final adminAccessToken = await storage.read(key: 'admin_access_token');
        final studentAccessToken = await storage.read(key: 'access_token');
        if (adminAccessToken != null && mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context, '/adminSide', (route) => false);
        } else if (studentAccessToken != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/studentHome', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/loginScreen', (route) => false);
        }
    });
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();

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
