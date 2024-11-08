import 'package:flutter/material.dart';

class PaymentOptionTextField extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const PaymentOptionTextField({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
          ),
          hintText: label,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          suffixIcon: IconButton(
            icon: Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: const Color(0xff1C3764),
            ),
            onPressed: onSelected,
          ),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
