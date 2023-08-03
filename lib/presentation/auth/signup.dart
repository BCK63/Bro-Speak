import 'dart:async';
import 'package:bro_speak/application/bloc/auth_bloc.dart';
import 'package:bro_speak/core/button_style.dart';
import 'package:bro_speak/core/colors.dart';
import 'package:bro_speak/core/size.dart';
import 'package:bro_speak/presentation/auth/widget/widgets.dart';
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late AuthBloc authBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController batchController = TextEditingController();
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
  final _formkey = GlobalKey<FormState>();
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
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            current is AuthActionState || current is AuthState,
        listener: (context, state) {
          if (state is UserSignUpSuccessState) {
            Navigator.pop(context);
          } else if (state is SignUpSuccessActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Signup Successful"),backgroundColor: Colors.green,),);
          } else if (state is AuthErrorActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Email already exist with another user")));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             const SizedBox(
              child: BroSpeakLogo(
            changableHeight: 50,
            changableWidth: 110,
            firstSpace: 5,
            secondSpace: 8,
            subtitleSize: 15,
            titleSize: 50,
          ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      NeoTextFormField(
                        controller: fullNameController,
                        hintText: 'Fullname',
                      ),
                      kHeight(10.h),
                      NeoTextFormField(
                        controller: batchController,
                        hintText: 'Batch',
                      ),
                      kHeight(10.h),
                      NeoTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      kHeight(10.h),
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
                      kHeight(10.h),
                      NeoTextFormField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        autocorrect: false,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPassVisiblity =
                                    !isConfirmPassVisiblity;
                              });
                            },
                            icon: Icon(
                              isConfirmPassVisiblity
                                  ? Icons.remove_red_eye_rounded
                                  : Icons.visibility_off_rounded,
                              color: authPagesBlueColor,
                            )),
                        obscureText: !isConfirmPassVisiblity,
                        enableSuggestions: false,
                      ),
                      kHeight(15.h),
                      SizedBox(
                        width: w / 1.1,
                        height: 50,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is SignUpLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ElevatedButton(
                                onPressed: () {
                                  bool? emailStatus;
                                  if (emailController.text.isNotEmpty) {
                                    emailStatus =
                                        emailValidation(emailController.text);
                                  }

                                  if (fullNameController.text.isNotEmpty &&
                                      emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty &&
                                      batchController.text.isNotEmpty &&
                                      emailStatus! &&
                                      passwordController.text.length >= 6 &&
                                      confirmPasswordController.text ==
                                          passwordController.text) {
                                    authBloc.add(SignUpButtonPressedEvent(
                                        fullNameController.text,
                                        batchController.text,
                                        emailController.text.trim(),
                                        passwordController.text.trim()));
                                  } else if (emailStatus != null &&
                                      !emailStatus) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "Please provide a valid email address.")));
                                  } else if (passwordController
                                          .text.isNotEmpty &&
                                      passwordController.text.length < 6) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "Password Minimum length of 6 characters")));
                                  } else if (confirmPasswordController.text !=
                                      passwordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content:
                                                Text("Password Must Be Same")));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "All Fields Are Required")));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: authPagesBlueColor,
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
                              );
                            }
                          },
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
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 18, color: authPagesBlueColor),
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
      ),
    );
  }

  bool emailValidation(value) {
    bool emailResult = EmailValidator.validate(value);
    return emailResult;
  }
}
