import 'dart:developer';

import 'package:bro_speak/application/bloc/auth_bloc.dart';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:bro_speak/presentation/auth/login.dart';
import 'package:bro_speak/presentation/main_screen/admin_home.dart';
import 'package:bro_speak/presentation/main_screen/bottom_nav/bottom_nav.dart';
import 'package:bro_speak/presentation/main_screen/new_admin_form.dart';
import 'package:bro_speak/presentation/not_found.dart';
import 'package:bro_speak/presentation/splash_screen/splash_screen.dart';
import 'package:bro_speak/presentation/students/students_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initDynamicLinks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(AuthRepository()),
          )
        ],
        child: MaterialApp(
          initialRoute: "/splash",
          routes: {
            '/adminSide':(context) => BottomNavController(),
            '/splash': (context) =>  SplashScreen(),
            '/adminHome': (context) => AdminHome(),
            '/loginScreen': (context) => const LoginScreen(),
            '/studentHome':(context) =>const StudentHomeScreen(),
            // '/home': (context) => const HomeScreen(),
          },
          onGenerateRoute: (RouteSettings settings) {
            print('entered onGenerateRoute');
            if (settings.name == "/") {
              return MaterialPageRoute(
                builder: (context) =>  SplashScreen(),
              );
            } else {
              final Uri uri = Uri.parse(settings.name!);
              final String? id = uri.queryParameters['id'];
              return MaterialPageRoute(
                builder: (context) => SplashScreen(id: id),
              );
            }
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (context) => const NotFoundScreen(),
            );
          },
          title: 'BRO SPEAK',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  Future<void> initDynamicLinks(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLink) async {
      final Uri deepLink = dynamicLink.link;
      print(
        '$deepLink adlkjaddflkjaddsflkjadsflkjasddflkjasdflkjasdlfkjasddflkjaddf',
      );
      if (deepLink != null && deepLink.queryParameters.containsKey('id')) {
        String? id = deepLink.queryParameters['id'];
        // Handle the 'id' parameter as needed. You can navigate to the HomeScreen or handle it in your application logic.
        Navigator.pushNamed(context, '/splash', arguments: id);
      } else {
        // Handle other cases if needed.
      }
    }, onError: (e) async {
      print('Dynamic Link Failed: ${e.message}');
    });
  }
}
