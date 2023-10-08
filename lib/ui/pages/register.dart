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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("REGISTER"),
            const Text("Maybe Bold"),
            MyForm(
              texts: textList,
              hintTexts: hintTextList,
              /* bottomWidget: Container(
                color: Colors.amber,
                child: const CheckButton(
                  text: "Terminos y condiciones",
                ),
              ), */
              buttonText: "Continuar",
              onPressed: () async => await Get.toNamed("/homepage"),
            ),
            const Text("Final")
          ],
        ),
      ),
    )));
  }
}
