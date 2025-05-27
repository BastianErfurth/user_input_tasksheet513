import 'package:flutter/material.dart';

class Tasksheet522 extends StatefulWidget {
  const Tasksheet522({super.key});

  @override
  State<Tasksheet522> createState() => _Tasksheet522State();
}

class _Tasksheet522State extends State<Tasksheet522> {
  bool isLoading = false;
  String showedText = "Hello";
  Future<String> tripleText(String textInput) async {
    await Future.delayed(Duration(seconds: 3));
    try {} catch (e) {
      debugPrint("Error: $e");
    }
    textInput = showedText;
    return textInput * 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Tasksheet 5.2.2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Text(showedText),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  String result = await tripleText(showedText);

                  setState(() {
                    showedText = result;
                    isLoading = false;
                  });
                },
                child: isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : Text("click"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
