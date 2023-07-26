
import 'package:flutter/material.dart';

class NewAdminFormScreen extends StatefulWidget {
  const NewAdminFormScreen({super.key,this.id});

final String? id;
  @override
  State<NewAdminFormScreen> createState() => _NewAdminFormScreenState();
}

class _NewAdminFormScreenState extends State<NewAdminFormScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Row(
          children: [
            Text(widget.id.toString()),
            Text('home'),
          ],
        ),
      ),
    );
  }
}
