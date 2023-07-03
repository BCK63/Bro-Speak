import 'dart:developer';

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
  // var value =await createDynamicLink();
   initDynamicLinks();
  // log(value.toString());

  runApp(const MyApp());
}
// // import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<void> initDynamicLinks() async {
  final PendingDynamicLinkData? data =
      await FirebaseDynamicLinks.instance.getInitialLink();
     try{ if(data==null){
        log('nullendran');
      }}catch (e){
        log(data.toString());
      }
      }
//   if (data != null) {
//       log(data.toString());

//     final Uri? deepLink = data.link;
//   print(deepLink);

// // log(deepLink.toString(),name: "First1111");
//     if (deepLink != null) {
//       final String parameterValue = deepLink.pathSegments.last;
//       print('Parameter value: $parameterValue');
//       // Store the parameter value in a variable or perform any other action

//       // Navigating to the appropriate screen based on the parameter value
//       if (parameterValue == 'AdminRoute') {
//         // Navigate to the AdminRoute screen
//         // For example:
//         log("Great");
//         // Navigator.pushNamed(context, '/AdminRoute');
//       } else if (parameterValue != 'AdminRoute') {
//         // Navigate to another screen
//         // For example:
//         log("Not greate");
//         // Navigator.pushNamed(context, '/AnotherRoute');
//       }
//     }

//     FirebaseDynamicLinks.instance.onLink.listen(
//       (PendingDynamicLinkData? dynamicLink) async {
//         final Uri? deepLink = dynamicLink?.link;
//         log(deepLink!.pathSegments.last.toString());
//         if (deepLink != null) {
//           final String parameterValue = deepLink.pathSegments.last;
//           print('Parameter value: $parameterValue');
//           // Store the parameter value in a variable or perform any other action

//           // Navigating to the appropriate screen based on the parameter value
//           if (parameterValue == 'AdminRoute') {
//             // Navigate to the AdminRoute screen
//             // For example:
//             // Navigator.pushNamed(context, '/AdminRoute');
//             log("Greate!", name: "lasdjkf");
//           } else if (parameterValue == 'AnotherRoute') {
//             // Navigate to another screen
//             // For example:
//             log("not Greate!", name: "lasdjkfadfljasdf");

//             // Navigator.pushNamed(context, '/AnotherRoute');
//           }
//         }
//       },
//       onError: (dynamic error) async {
//         // Handle any error that occurred while retrieving the dynamic link
//         print('Error retrieving dynamic link: $error');
//       },
//     );
//   }

  // FirebaseDynamicLinks.instance.onLink.listen(
  //   onSuccess: (PendingDynamicLinkData dynamicLink) async {
  //     final Uri deepLink = dynamicLink.link;
  //     if (deepLink != null) {
  //       final String parameterValue = deepLink.pathSegments.last;
  //       print('Parameter value: $parameterValue');
  //       // Store the parameter value in a variable or perform any other action

  //       // Navigating to the appropriate screen based on the parameter value
  //       if (parameterValue == 'AdminRoute') {
  //         // Navigate to the AdminRoute screen
  //         // For example:
  //         Navigator.pushNamed(context, '/AdminRoute');
  //       } else if (parameterValue == 'AnotherRoute') {
  //         // Navigate to another screen
  //         // For example:
  //         Navigator.pushNamed(context, '/AnotherRoute');
  //       }
  //     }
  //   },
  //   onError: (OnLinkErrorException e) async {
  //     // Handle any error that occurred while retrieving the dynamic link
  //     print('Error retrieving dynamic link: $e');
  //   },
  // );
// }sddlkjsdlkjsdlkjsldkjadslkjsdlkjsldkjslkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj

// // Future<ShortDynamicLink?> createDynamicLink() async {
// //   final DynamicLinkParameters parameters = DynamicLinkParameters(
// //     uriPrefix: 'https://brospeakapp.page.link',
// //     link: Uri.parse('https://example.com'),
// //     androidParameters: const AndroidParameters(
// //       packageName: 'com.example.bro_speak',
// //     ),
// //   );

// //   ShortDynamicLink? dynamicUrl;
// //   try {
// //     dynamicUrl = FirebaseDynamicLinksPlatform.instance.buildShortLink(parameters) as ShortDynamicLink;
// //   } catch (e) {
// //     // Handle any error that occurred while building the dynamic link
// //     print('Error creating dynamic link: $e');
// //   }

// //   // Retrieve the dynamic link URL and query parameters
// //   if (dynamicUrl != null) {
// //     final Uri shortUrl = dynamicUrl.shortUrl;
// //     print('Dynamic link: $shortUrl');

// //     final Uri dynamicLinkUri = Uri.parse(shortUrl.toString());
// //     final String? parameterValue = dynamicLinkUri.queryParameters['AdminRoute'];

// //     print('Parameter value: $parameterValue');
// //   }

// //   return dynamicUrl;
// // }

// //     Future<ShortDynamicLink?> createDDynamicLink() async {
// //   final DynamicLinkParameters parameters = DynamicLinkParameters(
// //     uriPrefix: 'https://brospeakapp.page.link',
// //     link: Uri.parse('https://example.com'),
// //     androidParameters: const AndroidParameters(
// //       packageName: 'com.example.bro_speak',
// //     ),

// //   );
// //   if(parameters != null){
// //     log(parameters.uriPrefix.toString());
// //     log(parameters.androidParameters.toString());

// //   }else{
// //     log("NOthing!");
// //   }
// // return null;
// //   //  ShortDynamicLink dynamicUrl = await parameters.
// //   // return
// // }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Future<Uri> createDynamicLink()async{
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(link: Uri.parse("https://bro_speak.com/home?param1=value1&param2=value2"), uriPrefix: "https://brospeakapp.page.link",androidParameters: AndroidParameters(packageName: 'com.example.bro_speak'));

  //     parameters.dynamicLinkParametersOptions = DynamicLinkParametersOptions(
  //   shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
  //   customParameters: <String, dynamic>{
  //     'param1': 'value1',
  //     'param2': 'value2',
  //   },
  // );

// // final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
// //   return dynamicUrl.shortUrl;
//   // }
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

// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// void initDynamicLinks() async {
//   final PendingDynamicLinkData? data =
//       await FirebaseDynamicLinks.instance.getInitialLink();
//   final Uri? deepLink = data?.link;

//   if (deepLink != null) {
//     final String parameterValue = deepLink.pathSegments.last;
//     print('Parameter value: $parameterValue');
//     // Store the parameter value in a variable or perform any other action

//     // Navigating to the appropriate screen based on the parameter value
//     if (parameterValue == 'AdminRoute') {
//       // Navigate to the AdminRoute screen
//       // For example:
//       Navigator.pushNamed(context, '/AdminRoute');
//     } else if (parameterValue == 'AnotherRoute') {
//       // Navigate to another screen
//       // For example:
//       Navigator.pushNamed(context, '/AnotherRoute');
//     }
//   }

//   FirebaseDynamicLinks.instance.onLink(
//     onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//       final Uri? deepLink = dynamicLink?.link;
//       if (deepLink != null) {
//         final String parameterValue = deepLink.pathSegments.last;
//         print('Parameter value: $parameterValue');
//         // Store the parameter value in a variable or perform any other action

//         // Navigating to the appropriate screen based on the parameter value
//         if (parameterValue == 'AdminRoute') {
//           // Navigate to the AdminRoute screen
//           // For example:
//           Navigator.pushNamed(context, '/AdminRoute');
//         } else if (parameterValue == 'AnotherRoute') {
//           // Navigate to another screen
//           // For example:
//           Navigator.pushNamed(context, '/AnotherRoute');
//         }
//       }
//     },
//     onError: (OnLinkErrorException e) async {
//       // Handle any error that occurred while retrieving the dynamic link
//       print('Error retrieving dynamic link: $e');
//     },
//   );
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   initDynamicLinks();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const SplashScreen(),
//         '/AdminRoute': (context) => const AdminRoute(),
//         '/AnotherRoute': (context) => const AnotherRoute(),
//       },
//     );
//   }
// }

