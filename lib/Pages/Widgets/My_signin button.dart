import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  final String;
  final width;
  final height;
  final List;
  final Color;
  final double radius;

  const LoginButton(
      {super.key,
      required this.onTap,
      required this.String,
      required this.height,
      required this.width,
      required this.List,
      this.Color, required this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: List, begin: Alignment(0, 0), end: Alignment(0, 1)),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          // Correctly assigned color
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 1.4,
            ),
          ],
        ),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              String,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
