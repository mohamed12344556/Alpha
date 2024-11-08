import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final Color borderColor; // Fixed to use the proper type and name for color
  final TextAlign align;
  final width;
  final height;
  final Color color; // Fixed to use the proper type and name for color
  final Container container;

  const MyTextFeild({
    Key? key,
    required this.controller,
    required this.align,
    required this.hintText,
    required this.obscureText,
    required this.borderColor,
    this.onChanged,
    this.width,
    this.height,
    required this.color,
    required this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Colors.transparent, // Correctly assigned color
      ),

      // Use of correct MediaQuery syntax
      child: Row(
        children: [
          container,
          Container(
            decoration: BoxDecoration(
            ),
            height: height,
            width: width,
            child: TextField(
              cursorHeight: 40,
              cursorColor: Colors.black38,
              textAlign: align,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
              onChanged: onChanged,
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(

                fillColor: color,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
