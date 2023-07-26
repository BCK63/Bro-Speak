import 'dart:convert';
import 'dart:math';

import 'package:bro_speak/domain/auth_model.dart';
import 'package:bro_speak/infrastructure/api/end_point.dart';
import 'package:bro_speak/presentation/admin/admin_list.dart';
import 'package:bro_speak/presentation/auth/widget/widgets.dart';
import 'package:bro_speak/presentation/widgets/app_logo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  Dio dio = Dio();
  String adminInvitePath = "http://10.4.4.63:3000/api/v1/admin/invite";

  TextEditingController emailController = TextEditingController();
  FlutterSecureStorage storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
             
        drawer: Drawer(
          
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "view Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    )
                  ],
                ),
              ),
              Card(
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.people_alt),
                  title: const Text('Admins'),
                  onTap: () {
        
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllAdminsList(),));
                  },
                ),
              ),
              Card(
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.people_outline),
                  title: const Text('Batches'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Card(
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.holiday_village_outlined),
                  title: const Text('Halls'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
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
      ),
    );
  }

  Future<String> getAdminAccesToken() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? accesToken = await storage.read(key: 'admin_access_token');
    String? token = accesToken!.replaceAll('"', '');
    String ogToken = token.replaceAll('Bearer ', '');
    print(ogToken);
    return ogToken;
  }
}
