import 'package:banca_creditos_app/ui/widgets/checkButton.dart';
import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final List<String> textList = [
    "Nombre Completo",
    "Identificación",
    "Email",
    "Contraseña"
  ];
  final List<String> hintTextList = [
    "Escribe tu nombre",
    "Escribe tu número de identificación",
    "Uname@gmail.com",
    "Password"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("REGISTER"),
          const Text("Maybe Bold"),
          Container(
            height: 600,
            color: Colors.purple,
            child: MyForm(
              texts: textList,
              hintTexts: hintTextList,
              bottomWidget: const CheckButton(
                text: "Terminos y condiciones",
              ),
              buttonText: "Continuar",
              onPressed: () async => await Get.toNamed("/homepage"),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 100,
          ),
          const Text("Final")
        ],
      ),
    );
  }
}
