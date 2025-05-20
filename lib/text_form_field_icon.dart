import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Widget iconButton;
  final bool obscureText;
  final TextEditingController controller;
  const TextFieldWithIcon({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.iconButton,
    required this.obscureText,
    required this.controller,
  });

  @override
  State<TextFieldWithIcon> createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<TextFieldWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.tealAccent, Colors.teal]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            suffixIcon: widget.iconButton,
            labelText: widget.labelText,
            labelStyle: TextStyle(color: Colors.black),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ));
  }
}
