import 'package:flutter/material.dart';
import 'package:user_input_tasksheet513/text_form_field.dart';
import 'package:user_input_tasksheet513/text_form_field_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bool _isObscured = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isButtonDisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Form(
            onChanged: () {
              setState(() {
                final bool isFormValid = formKey.currentState!.validate();
                _isButtonDisable = !isFormValid;
              });
            },
            key: formKey,
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
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        obscureText: _isObscured,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Passwort vergessen?"),
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        validator: validateContractName,
                        //autovalidateMode: AutovalidateMode.onUnfocus,
                        decoration: InputDecoration(
                          fillColor: Colors.cyan,
                          border: OutlineInputBorder(),
                          hintText: "Vertragsname",
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        validator: validateCost,
                        //autovalidateMode: AutovalidateMode.onUnfocus,
                        decoration: InputDecoration(
                          fillColor: Colors.cyan,
                          border: OutlineInputBorder(),
                          hintText: "Kostenangabe",
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        validator: validateAge,
                        //autovalidateMode: AutovalidateMode.onUnfocus,
                        decoration: InputDecoration(
                          fillColor: Colors.cyan,
                          border: OutlineInputBorder(),
                          hintText: "Altersangabe",
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isButtonDisable
                              ? null
                              : () {
                                  final bool isFormValid = formKey.currentState!
                                      .validate();
                                  if (isFormValid) {
                                    // dann irgendwas mit Firebase oder Mock-Datenbank
                                  }
                                },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    const Text("Noch kein Konto?"),
                    TextButton(onPressed: () {}, child: Text("Registrieren")),
                  ],
                ),
              ],
            ),
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

  String? validateContractName(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return "Bitte Vertragsnamen eingeben";
    }
    if (userInput.length < 3) {
      return "Vertragsname muss mindestens 3 Zeichen lang sein";
    }
    if (userInput.length > 20) {
      return "Vertragsname darf maximal 20 Zeichen lang sein";
    }
    return null;
  }

  String? validateCost(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return "Bitte Kostenangabe eingeben";
    }
    if (double.tryParse(userInput) == null) {
      return "Bitte eine gültige Zahl eingeben";
    }
    if (double.parse(userInput) < 0) {
      return "Bitte eine positive Zahl eingeben";
    }
    if (userInput.contains(" ")) {
      return "Bitte keine Leerzeichen verwenden";
    }
    if (userInput.contains(",")) {
      return "Bitte Punkt statt Komm verwenden";
    }

    return null;
  }

  String? validateAge(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return "Bitte Altersangabe eingeben";
    }
    if (int.tryParse(userInput) == null) {
      return "Bitte eine gültige Zahl eingeben";
    }
    if (userInput.contains(",")) {
      return "Bitte keine KOmma, sondern Punkt verwenden";
    }
    if (int.parse(userInput) < 0) {
      return "Bitte eine positive Zahl eingeben";
    }
    if (int.parse(userInput) > 120) {
      return "Bitte eine Zahl kleiner als 120 eingeben";
    }
    if (userInput.length > 3) {
      return "Bitte keine mehr als 3 Ziffern eingeben";
    }

    return null;
  }
}
