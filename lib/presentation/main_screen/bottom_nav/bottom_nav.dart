import 'dart:developer';

import 'package:bro_speak/presentation/admin/admin_list.dart';
import 'package:bro_speak/presentation/auth/admin_signup.dart';
import 'package:bro_speak/presentation/main_screen/admin_home.dart';
import 'package:bro_speak/presentation/not_found.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key, required this.comingFron});

  final comingFron;
  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     log(widget.comingFron.toString(), name: "alkjfasd");
  }

  int currentIndex = 0;

  List<Widget> screens = [
    AdminHome(),
    const AdminSignUp(),
    AllAdminsList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Card(
        margin: const EdgeInsets.all(1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              tabBorderRadius: 150,
              tabBackgroundColor: Colors.grey.withOpacity(0.09),
              gap: 5,
              haptic: true,
              padding: const EdgeInsets.all(12),
              activeColor: Colors.white,
              color: Colors.white54,
              onTabChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.headphones_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.playlist_add_outlined,
                  text: 'Playlist',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Settings',
                )
              ]),
        ),
      ),
    );
  }
}
