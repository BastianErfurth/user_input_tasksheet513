import 'package:flutter/material.dart';

class ZweiterScreen extends StatelessWidget {
  const ZweiterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 200,
                  width: 200,
                  color: Colors.yellow,
                  child: Center(child: Text("Willkommen auf Screen 2"))),
            ],
          ),
        ),
      ),
    );
  }
}
