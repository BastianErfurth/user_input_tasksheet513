import 'package:flutter/material.dart';
import 'package:user_input_tasksheet513/text_form_field.dart';
import 'package:user_input_tasksheet513/text_form_field_icon.dart';
import 'package:user_input_tasksheet513/zweiter_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Willkommen !", style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormFieldWithoutIcon(
                      controller: _emailController,
                      labelText: "Email",
                      hintText: "Emailadresse eingeben",
                    ),
                    SizedBox(height: 24),
                    TextFieldWithIcon(
                      controller: _passwordController,
                      labelText: "Passwort",
                      hintText: "Passwort eingeben",
                      iconButton: IconButton(
                        onPressed: () {},
                        icon: Icon(_isObscured
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      obscureText: _isObscured,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Passwort vergessen?",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          print("Login Button pressed");
                          print(_emailController.text);
                          print(_passwordController.text);
                          if (_emailController.text == "Max@web.de" &&
                              _passwordController.text == "123456") {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ZweiterScreen(),
                            ));
                          } else {
                            print("fehlerhafte Eingabe");
                            _emailController.clear();
                            _passwordController.clear();
                          }
                        },
                        child: const Text(
                          "Login",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.white,
                  )),
                  Text("Oder mit"),
                  Expanded(
                      child: Divider(
                    color: Colors.white,
                  )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton.icon(
                      onPressed: () {},
                      label: Center(
                        child: Row(children: [
                          Icon(Icons.apple),
                          //Text("Login with Apple")
                        ]),
                      )),
                  FilledButton(
                      onPressed: () {},
                      child: Center(
                        child: Row(
                          spacing: 4,
                          children: [
                            Icon(Icons.facebook),
                            //Text("Login with Facebook")
                          ],
                        ),
                      )),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  const Text("Noch kein Konto?"),
                  TextButton(
                    onPressed: () {},
                    child: Text("Registrieren"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
