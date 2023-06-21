import 'dart:async';
import 'package:bro_speak/application/repository/auth_repo.dart';
import 'package:bro_speak/core/button_style.dart';
import 'package:bro_speak/core/colors.dart';
import 'package:bro_speak/core/size.dart';
import 'package:bro_speak/presentation/auth/signup.dart';
import 'package:bro_speak/presentation/auth/widget/widgets.dart';
import 'package:bro_speak/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisibility = false;
  AnimationController? controller1;
  Animation<double>? animation1;

  AnimationController? controller2;
  Animation<double>? animation2;

  AnimationController? controller3;
  Animation<double>? animation3;

  AnimationController? controller4;
  Animation<double>? animation4;
  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation1 = Tween<double>(begin: 1.9, end: 2.1)
        .animate(CurvedAnimation(parent: controller1!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1!.forward();
        }
      });

    controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation2 = Tween<double>(begin: 1.8, end: 2.4)
        .animate(CurvedAnimation(parent: controller2!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2!.forward();
        }
      });

    controller3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation3 = Tween<double>(begin: 1.8, end: 2.4)
        .animate(CurvedAnimation(parent: controller3!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller3!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller3!.forward();
        }
      });

    controller4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation4 = Tween<double>(begin: 1.9, end: 2.1)
        .animate(CurvedAnimation(parent: controller4!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller4!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller4!.forward();
        }
      });

    controller4!.forward();

    Timer(const Duration(milliseconds: 800), () {
      controller3!.forward();
    });
    //
    Timer(const Duration(milliseconds: 1600), () {
      controller2!.forward();
    });
    //
    Timer(const Duration(milliseconds: 2000), () {
      controller1!.forward();
    });
  }

  @override
  void dispose() {
    controller1!.dispose();
    controller2!.dispose();
    controller3!.dispose();
    controller4!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            child: BroSpeakLogo(),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  NeoTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  kHeight(20),
                  NeoTextFormField(
                    obscureText: !isPasswordVisibility,
                    enableSuggestions: false,
                    autocorrect: false,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisibility = !isPasswordVisibility;
                          });
                        },
                        icon: Icon(
                          isPasswordVisibility
                              ? Icons.remove_red_eye_rounded
                              : Icons.visibility_off_rounded,
                          color: authPagesBlueColor,
                        )),
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  kHeight(h / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ));
                        },
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero),
                            elevation: MaterialStatePropertyAll(5.0)),
                        child: Text(
                          "Forgot Password",
                          style: normalButtonStyle.copyWith(
                              color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  kHeight(h / 30),
                  SizedBox(
                    width: 360,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthRepository().logInServices(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: authPagesBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Set border radius as desired
                        ),
                      ),
                      child: Text(
                        "LOGIN",
                        style: mainButtonTextStyle.copyWith(
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  kHeight(h / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18, color: authPagesBlueColor),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: CustomPaint(
              painter: MyPainter(animation1!.value, animation2!.value,
                  animation3!.value, animation4!.value),
              child: SizedBox(
                height: h / 4 - 40,
                width: w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
