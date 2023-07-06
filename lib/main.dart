import 'package:bro_speak/application/bloc/auth_bloc.dart';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:bro_speak/presentation/home/home_screen.dart';
import 'package:bro_speak/presentation/splash_screen/splash_screen.dart';
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
    super.initState();
    initDynamicLinks();
  }

 Future<void> initDynamicLinks() async {
      FirebaseDynamicLinks.instance.onLink(
    onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;
      if (deepLink != null && deepLink.queryParameters.containsKey('id')) {
        String id = deepLink.queryParameters['id']!;
        // Do whatever you need with the ID
        print('Received ID: $id');
      }
    },
    onError: (OnLinkErrorException e) async {
      print('Dynamic Link Failed: ${e.message}');
    },
  );


    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink?.link != null && initialLink!.link.queryParameters.containsKey('id')) {
      String id = initialLink.link.queryParameters['id']!;

      // Do whatever you need with the ID
      print('Received ID: $id');
    }
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
          initialRoute: "/",
          routes: {
            "/": (context) => const SplashScreen(),
            "/home": (context) => const HomeScreen()
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

