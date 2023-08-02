import 'dart:developer';

import 'package:bro_speak/application/admin/bloc/admin_bloc.dart';
import 'package:bro_speak/application/admin/repository/admin_repository.dart';
import 'package:bro_speak/application/bloc/auth_bloc.dart';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:bro_speak/presentation/auth/admin_signup.dart';
import 'package:bro_speak/presentation/auth/login.dart';
import 'package:bro_speak/presentation/main_screen/admin_home.dart';
import 'package:bro_speak/presentation/main_screen/bottom_nav/bottom_nav.dart';
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
  bool dynamicLinksInitialized = false;
  bool bottomNavControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    if (!dynamicLinksInitialized) {
      initDynamicLinks(context);
      dynamicLinksInitialized = true;
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ScreenUtilInit(
  //     designSize: const Size(360, 690),
  //     minTextAdapt: true,
  //     splitScreenMode: true,
  //     builder: (context, child) => MultiBlocProvider(
  //       providers: [
  //         BlocProvider(
  //           create: (context) => AuthBloc(AuthRepository()),
  //         ),
  //         BlocProvider(
  //           create: (context) => AdminBloc(AdminRepository()),
  //         ),
  //       ],
  //       child: MaterialApp(
  //         initialRoute: "/splash",
  //         routes: {
  //           '/splash': (context) {
  //             if (!bottomNavControllerInitialized) {
  //               bottomNavControllerInitialized = true;
  //               return const SplashScreen();
  //             } else {
  //               return const SizedBox.shrink();
  //             }
  //           },
  //           '/adminHome': (context) => AdminHome(),
  //           '/loginScreen': (context) => const LoginScreen(),
  //           '/studentHome': (context) => const StudentHomeScreen(),
  //         },
  //         onGenerateRoute: (RouteSettings settings) {
  //             bool entered = false;
  //           if (settings.name!.contains('/splash?id=')) {
  //             log("entered here also1");
  //             entered = true;
  //             final Uri uri = Uri.parse(settings.name!);
  //             final String? id = uri.queryParameters['id'];
  //             return MaterialPageRoute(
  //               builder: (context) => SplashScreen(
  //                 id: id,
  //               ),
  //             );
  //           }
  //           if (settings.name == "/" && !entered) {
  //              log("entered here also2");
  //             return MaterialPageRoute(
  //               builder: (context) => const SplashScreen(
  //               ),
  //             );
  //           }
  //           // ... (the rest of your code)
  //         },
  //         onUnknownRoute: (RouteSettings settings) {
  //           return  MaterialPageRoute(
  //             builder: (context) => const NotFoundScreen(),
  //           );
  //         },
  //         title: 'BRO SPEAK',
  //         theme: ThemeData.dark(
  //           useMaterial3: true,
  //         ),
  //         debugShowCheckedModeBanner: false,
  //       ),
  //     ),
  //   );
  // }

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
          ),
          BlocProvider(
            create: (context) => AdminBloc(AdminRepository()),
          ),
        ],
        child: MaterialApp(
          
          routes: {
            '/adminSide': (context) => const BottomNavController(
                  comingFron: 'main',
                ),
            '/adminHome': (context) => AdminHome(),
            '/loginScreen': (context) => const LoginScreen(),
            '/studentHome': (context) => const StudentHomeScreen(),
          },
          onGenerateRoute: (RouteSettings settings) {
            bool isEntered = false;
            if (settings.name!.contains('/splash?id=')) {
              log("entered here also1");
              isEntered = true;
              final Uri uri = Uri.parse(settings.name!);
              final String? id = uri.queryParameters['id'];
              return MaterialPageRoute(
                builder: (context) =>  AdminSignUp(id: id,)
              );
            }
            if (settings.name == "/" && !isEntered) {
              log("entered here also2");
              return MaterialPageRoute(
                builder: (context) => const SplashScreen(),
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

      if (deepLink != null && deepLink.queryParameters.containsKey('id')) {
        print('entered here');
      } else {
        print('entered else');
      }
    }, onError: (e) async {
      print('Dynamic Link Failed: ${e.message}');
    });
  }
}
