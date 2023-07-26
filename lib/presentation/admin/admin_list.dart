
import 'package:bro_speak/core/colors.dart';
import 'package:bro_speak/core/size.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllAdminsList extends StatelessWidget {
  AllAdminsList({super.key});
  final _formkey = GlobalKey<FormState>();
  TextEditingController invitationEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text(
          "ADMINS",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: IconButton(
              onPressed: () {
                showDialogForInvitingNewAdmin(
                    context, height, width, invitationEmailController);
              },
              icon: const Icon(Icons.add),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 13, left: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(.0),
              child: SizedBox(
                height: 35.h,
                width: width,
                child: const CupertinoSearchTextField(),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://i.pinimg.com/564x/d3/ab/54/d3ab547ec2c98f35dc84e9b8acf63f80.jpg"))),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maria",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                              Text(
                                "maria123@gmail.com",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Hub1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert_outlined))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDialogForInvitingNewAdmin(
      context, height, width, TextEditingController invitationEmailController) {
    showDialog(
      context: context,
      builder: (context) => SizedBox(
        child: SimpleDialog(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    const Text(
                      "INVITE NEW ADMIN",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    kHeight(18),
                    const Center(
                      child: Text(
                        "Enter new admin's email and click invite to invite new admin.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ),
                    kHeight(20),
                    Form(
                      key: _formkey,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: invitationEmailController,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Email Field is Required';
                          } else if (!emailValidation(
                              invitationEmailController.text)) {
                            return 'Enter a Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    kHeight(20),
                    SizedBox(
                      height: 45,
                      width: double.infinity / 1.1,
                      child: ElevatedButton(
                        onPressed: () {
                          inviteButtonClicked(context);
                        },
                        child: const Text(
                          "INVITE",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: authPagesBlueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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

  void inviteButtonClicked(context) {
    if (_formkey.currentState!.validate()) {
      showConfirmAlertDialogue(context);
    }
  }

  void showConfirmAlertDialogue(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("EMAIL CONFIRMATION"),
        content: Text(
            "Are you sure that ${invitationEmailController.text} is the invitation email"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("EDIT")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("YES")),
        ],
      ),
    );
  }
}
