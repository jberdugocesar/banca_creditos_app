import 'package:banca_creditos_app/ui/widgets/checkButton.dart';
import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final List<String> text = ["Email o Usuario", "Contraseña"];
  final List<String> hintTextList = ["Uname@gmail.com", "Password"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Login"),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.red,
              child: MyForm(
                texts: text,
                hintTexts: hintTextList,
                buttonText: "Iniciar Sesión",
                onPressed: () async => await Get.toNamed("/homepage"),
                bottomWidget: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CheckButton(text: "Recuerdame"),
                    Text("Olvide mi Contraseña?")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
