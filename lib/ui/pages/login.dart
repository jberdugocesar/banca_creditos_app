import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:banca_creditos_app/ui/widgets/checkButton.dart';
import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<String> textList = ["Email o Usuario", "Contraseña"];

  final List<String> hintTextList = ["Uname@gmail.com", "Password"];

  AuthenticationController authenticationController = Get.find();

  late int _nroOfForms;

  late List<TextEditingController> textControllers;

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
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Login"),
            MyForm(
              texts: textList,
              hintTexts: hintTextList,
              controllers: textControllers,
              buttonText: "Iniciar Sesión",
              onPressed: () async {
                String email = textControllers[0].text;
                String password = textControllers[1].text;
                try {
                  var value =
                      await authenticationController.login(email, password);

                  if (value) {
                    await Get.offAllNamed("/homepage");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Incorrect user or password')));
                  }
                } catch (e) {
                  logInfo("error while login");
                }
              },
              bottomWidget: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CheckButton(text: "Recuerdame"),
                  Text("Olvide mi Contraseña?")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
