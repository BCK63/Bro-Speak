
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Student Home"),),
          ElevatedButton(onPressed: ()async{
            FlutterSecureStorage storage  = const FlutterSecureStorage();
            await storage.delete(key: 'access_token');
            Navigator.pushNamedAndRemoveUntil(context, "/loginScreen", (route) => false);
          }, child: const Text("LogOut",))
        ],
      ),
    );
  }
}