import 'dart:developer';

import 'package:bro_speak/application/admin/bloc/admin_bloc.dart';
import 'package:bro_speak/application/admin/repository/admin_repository.dart';
import 'package:bro_speak/application/bloc/auth_bloc.dart';
import 'package:bro_speak/application/provider/dynamiclinks_provider.dart';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:bro_speak/presentation/auth/admin_signup.dart';
import 'package:bro_speak/presentation/not_found.dart';
import 'package:bro_speak/presentation/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ListenableProvider(
        create: (context) => DynamicLinksssProvider(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(AuthRepository()),
            ),
            BlocProvider(
              create: (context) => AdminBloc(AdminRepository()),
            ),
          ],
          child: MaterialApp(
            onGenerateRoute: (RouteSettings settings) {
              if (settings.name!.contains('/splash?id=')) {
                log("entered here also1");

                final Uri uri = Uri.parse(settings.name!);
                final String? id = uri.queryParameters['id'];
                return MaterialPageRoute(
                    builder: (context) => AdminSignUp(
                          id: id,
                        ));
              }
            },
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (context) => const NotFoundScreen(),
              );
            },
            title: 'BRO SPEAK',
            home: const SplashScreen(),
            theme: ThemeData.dark(
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }

  Future<void> initDynamicLinks(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLink) async {
      final Uri deepLink = dynamicLink.link;

      if (deepLink != null && deepLink.queryParameters.containsKey('id')) {
        log('entered here');
      } else {
        log('entered else');
      }
    }, onError: (e) async {
      log('Dynamic Link Failed: ${e.message}');
    });
  }
}
