import 'dart:async';
import 'package:bro_speak/core/button_style.dart';
import 'package:bro_speak/core/colors.dart';
import 'package:bro_speak/core/size.dart';
import 'package:bro_speak/presentation/auth/widget/widgets.dart';
import 'package:bro_speak/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisibility = false;
  bool isConfirmPassVisiblity = false;

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
        automaticallyImplyLeading: false,
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
                    controller: fullNameController,
                    hintText: 'Fullname',
                  ),
                  kHeight(h / 30),
                  NeoTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  kHeight(h / 30),
                  NeoTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
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
                    obscureText: !isPasswordVisibility,
                    enableSuggestions: false,
                  ),
                  kHeight(h / 30),
                  NeoTextFormField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPassVisiblity = !isConfirmPassVisiblity;
                          });
                        },
                        icon: Icon(
                          isConfirmPassVisiblity
                              ? Icons.remove_red_eye_rounded
                              : Icons.visibility_off_rounded,
                          color: authPagesBlueColor,
                        )),
                    autocorrect: false,
                    obscureText: !isConfirmPassVisiblity,
                    enableSuggestions: false,
                  ),
                  kHeight(h / 30),
                  Center(
                    child: RichText(
                        text:  TextSpan(
                            text:
                                'By clicking agree & Sign Up, You are agreed\n  to the ',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Privacy Policy ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: authPagesBlueColor)),
                          const TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: 'User Agreement',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: authPagesBlueColor)),
                        ])),
                  ),
                  kHeight(20),
                  SizedBox(
                    width: w / 1.1,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:authPagesBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Set border radius as desired
                        ),
                      ),
                      child: Text(
                        "SIGNUP",
                        style: mainButtonTextStyle.copyWith(
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  kHeight(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        child:  Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 18,
                              color: authPagesBlueColor),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
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
                height: h / 5 - 32,
                width: w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
