import 'dart:convert';
import 'dart:math';

import 'package:bro_speak/domain/auth_model.dart';
import 'package:bro_speak/infrastructure/api/end_point.dart';
import 'package:bro_speak/presentation/admin/admin_list.dart';
import 'package:bro_speak/presentation/auth/widget/widgets.dart';
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  TextEditingController emailController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SizedBox(
            
            child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.white,
                        ),
                        Text(
                          "William Jack",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "view Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Column(
              children: [
                Card(
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.people_alt),
                    title: const Text('Admins'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllAdminsList(),
                          ));
                    },
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.people_outline),
                    title: const Text('Batches'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Card(
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.holiday_village_outlined),
                    title: const Text('Halls'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )),
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                ),
                title: const Text('Log Out'),
                onTap: () async {
                  FlutterSecureStorage storage = const FlutterSecureStorage();
                  await storage.delete(key: 'admin_access_token');
                  await storage.delete(key: 'admin_refresh_token');
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/loginScreen', (route) => false);
                },
              ),
            ),
          ],
        )),
      ),
      appBar: AppBar(
        elevation: 1,
        actions: [
          const Icon(Icons.notifications),
          SizedBox(
            width: 15.w,
          ),
        ],
        centerTitle: true,
        title: const BroSpeakLogo(
          changableHeight: 20,
          changableWidth: 52,
          firstSpace: 2,
          secondSpace: 4,
          subtitleSize: 7.5,
          titleSize: 25,
        ),
      ),
    );
  }
}
