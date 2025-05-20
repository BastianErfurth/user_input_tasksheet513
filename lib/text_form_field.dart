import 'package:flutter/material.dart';

class TextFormFieldWithoutIcon extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  const TextFormFieldWithoutIcon({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.tealAccent, Colors.teal]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
