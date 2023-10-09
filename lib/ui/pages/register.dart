import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:banca_creditos_app/ui/controllers/user_controller.dart';
import 'package:banca_creditos_app/ui/widgets/checkButton.dart';
import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  late int _nroOfForms;

  late List<TextEditingController> textControllers;

  AuthenticationController authenticationController = Get.find();

  UserController userController = Get.find();

  @override
  void initState() {
    super.initState();
    _nroOfForms = textList.length;
    textControllers =
        List.generate(_nroOfForms, (_) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text("REGISTER"),
        const Text("Maybe Bold"),
        MyForm(
          texts: textList,
          hintTexts: hintTextList,
          controllers: textControllers,
          bottomWidget: const CheckButton(
            text: "Terminos y condiciones",
          ),
          buttonText: "Continuar",
          onPressed: () async {
            String fullName = textControllers[0].text;
            String personalId = textControllers[1].text;
            String email = textControllers[2].text;
            String password = textControllers[3].text;

            logInfo("email: $email and fullName: $fullName");

            try {
              await authenticationController.signUp(
                  email: email, password: password);

              await authenticationController.login(email, password);

              await userController.createUser(
                  email: email,
                  fullName: fullName,
                  personalId: personalId,
                  uid: authenticationController.getUid());

              logInfo(
                  "this is CurrentUser Prueba: ${userController.currentUser}");

              await Get.offAllNamed("/homepage");
            } catch (e) {
              logInfo("there was an error with the registering");
            }
          },
        ),
        const Text("Final")
      ],
    )));
  }
}
