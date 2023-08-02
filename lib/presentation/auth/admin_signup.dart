import 'package:bro_speak/application/bloc/auth_bloc.dart';
import 'package:bro_speak/application/provider/dynamiclinks_provider.dart';
import 'package:bro_speak/core/button_style.dart';
import 'package:bro_speak/core/colors.dart';
import 'package:bro_speak/core/size.dart';
import 'package:bro_speak/presentation/auth/login.dart';
import 'package:bro_speak/presentation/auth/widget/widgets.dart';
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({super.key, this.id});

  final String? id;
  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp>
    with TickerProviderStateMixin {
  late AuthBloc authBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisibility = false;
  bool isConfirmPassVisiblity = false;

  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DynamicLinksssProvider>(context, listen: false)
          .isEnteredThroughDynamicLinks = true;
    });
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    fullNameController.clear();
    confirmPasswordController.clear();
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
          if (state is AdminSignUpSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          } else if (state is AdminSignUpSuccessActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Signup Successful",
              ),
              backgroundColor: Colors.green,
            ));
          } else if (state is AdminError1ActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Email Not Matching with Invited Email")));
          } else if (state is AdminError2ActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Something went wrong!")));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      kHeight(15.h),
                      NeoTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      kHeight(15.h),
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
                      kHeight(15.h),
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
                            if (state is AdminSignUpLoadingState) {
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
                                      emailStatus! &&
                                      passwordController.text.length >= 6 &&
                                      confirmPasswordController.text ==
                                          passwordController.text) {
                                    authBloc.add(AdminSignUpButtonPressedEvent(
                                        fullNameController.text,
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                        widget.id.toString()));
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
                    ],
                  ),
                ),
              ),
            ),
            kHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Having an issue with this application?'),
                Text(
                  ' Tell us more',
                  style: TextStyle(color: Colors.blue.withOpacity(.9)),
                )
              ],
            )
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
