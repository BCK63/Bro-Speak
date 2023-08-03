import 'dart:async';
import 'package:bro_speak/core/button_style.dart';
import 'package:bro_speak/core/colors.dart';
import 'package:bro_speak/core/size.dart';
import 'package:bro_speak/presentation/auth/signup.dart';
import 'package:bro_speak/presentation/auth/widget/widgets.dart';
import 'package:bro_speak/presentation/main_screen/bottom_nav/bottom_nav.dart';
import 'package:bro_speak/presentation/students/students_home.dart';
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AuthBloc? authBloc;
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

    authBloc = BlocProvider.of<AuthBloc>(context);
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        controller4?.forward();
        Timer(const Duration(milliseconds: 800), () {
          controller3?.forward();
        });
        //
        Timer(const Duration(milliseconds: 1600), () {
          controller2?.forward();
        });
        //
        Timer(const Duration(milliseconds: 2000), () {
          controller1?.forward();
        });
      }
    });
  }

  int tapCount = 0;
  bool isAdmin = false;

  @override
  void dispose() {
    controller1?.dispose();
    controller2?.dispose();
    controller3?.dispose();
    controller4?.dispose();
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
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            current is AuthActionState || current is AuthState,
        listener: (context, state) {
          if (state is LogInSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentHomeScreen(),
                ),
                (route) => false);
          } else if (state is AdminLogInSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavController(
                    comingFron: 'LoginScreen bro!',
                  ),
                ),
                (route) => false);
          } else if (state is AdminLogInSuccessActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.green,
                content: const Text("Admin Login Successful")));
          } else if (state is LogInErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.red,
                content: const Text("User not found!")));
          } else if (state is AdminLoginErrorActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.red,
                content: const Text("Invalid email or password!")));
          } else if (state is LoginErrorActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.red,
                content: const Text("Invalid email or password!")));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: InkWell(
                
                highlightColor: Colors.transparent,
                onTap: () async {
                  tapCount++;
                  if (tapCount == 5) {
                    isAdmin = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("You are in admin side")));
                    await Future.delayed(const Duration(seconds: 60));
                    isAdmin = false;
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("You are in user side")));
                    }
                    tapCount = 0;
                  }
                },
                child: const BroSpeakLogo(
                  changableHeight: 50,
                  changableWidth: 110,
                  firstSpace: 5,
                  secondSpace: 8,
                  subtitleSize: 15,
                  titleSize: 50,
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    NeoTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    kHeight(20.h),
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
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              elevation: MaterialStatePropertyAll(5.0)),
                          child: Text(
                            "Forgot Password",
                            style: normalButtonStyle.copyWith(
                                color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is LogInLoadingState ||
                            state is AdminLogInLoadingState) {
                          return const CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            width: 360,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                bool? emailStatus;
                                if (emailController.text.isNotEmpty) {
                                  emailStatus =
                                      emailValidation(emailController.text);
                                }

                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty &&
                                    emailStatus! &&
                                    passwordController.text.length >= 6) {
                                  if (!isAdmin) {
                                    authBloc!.add(LogInButtonPressedEvent(
                                        emailController.text.trim(),
                                        passwordController.text.trim()));
                                  } else {
                                    authBloc!.add(AdminLogInButtonPressedEvent(
                                        emailController.text.trim(),
                                        passwordController.text.trim()));
                                  }
                                } else if (emailStatus != null &&
                                    !emailStatus) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          backgroundColor: Colors.red,
                                          content: const Text(
                                              "Please provide a valid email address.")));
                                } else if (passwordController.text.isNotEmpty &&
                                    passwordController.text.length < 6) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          backgroundColor: Colors.red,
                                          content: const Text(
                                              "Password Minimum length of 6 characters")));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          backgroundColor: Colors.red,
                                          content: const Text(
                                              "All Fields Are Required")));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: authPagesBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
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
                          );
                        }
                      },
                    ),
                    kHeight(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, "/home"),
                          child: const Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 18),
                          ),
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
                  height: h / 3.5 - 40.h,
                  width: w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool emailValidation(value) {
    bool emailResult = EmailValidator.validate(value);
    return emailResult;
  }
}
