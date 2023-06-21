import 'package:flutter/material.dart';

class MyTextFormFiled extends StatelessWidget {
  MyTextFormFiled({
    this.controller,
    this.keyboardType,
    this.validator,
    this.hintText,
    super.key,
  });
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.black.withAlpha(20),
            border: InputBorder.none),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double h1;
  final double h2;
  final double h3;
  final double h4;

  MyPainter(this.h1, this.h2, this.h3, this.h4);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint
      ..color = Colors.blue.withOpacity(.7)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height / h1);

    path.cubicTo(size.width * .35, size.height / h2, size.width * .65,
        size.height / h4, size.width, size.height / h4);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class NeoTextFormField extends StatelessWidget {
  NeoTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.enableSuggestions,
    this.autocorrect,
    this.obscureText,
  });
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool? obscureText;
  bool? autocorrect;
  bool? enableSuggestions;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        // color: const Color.fromARGB(255, 30, 28, 28),
        color: const Color.fromARGB(255, 29, 29, 29),

        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 23, 22, 22),
            offset: Offset(4.0, 4.0),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Color.fromARGB(255, 32, 31, 31),
            offset: Offset(-4.0, -4.0),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText ?? false,
        autocorrect: autocorrect ?? true,
        enableSuggestions: enableSuggestions ?? true,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 128, 128, 128)),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}
