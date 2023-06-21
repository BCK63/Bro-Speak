import 'package:bro_speak/application/bloc/auth_bloc.dart';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:bro_speak/presentation/home/home.dart';
import 'package:bro_speak/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          initialRoute: "/",
          routes: {
            "/": (context) => const SplashScreen(),
            "home": (context) => const HomePage()
          },
          title: 'Flutter Demo',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          // home: const SplashScreen(),
        ),
      ),
    );
  }
}
