import 'dart:ffi';

import 'package:banca_creditos_app/domain/models/credit.dart';
import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:banca_creditos_app/ui/controllers/credit_controller.dart';
import 'package:banca_creditos_app/ui/controllers/user_controller.dart';
import 'package:banca_creditos_app/ui/pages/credit_info_menu.dart';
import 'package:banca_creditos_app/ui/pages/credit_simulation.dart';
import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> text = [
    "Tipo de Credito",
    "Salario Base",
    "Monto a prestar",
    "Número de cuotas"
  ];

  final List<String> hintText = [
    "Selecciona el tipo de credito",
    "\$ 1.000.000",
    "\$ 20.000.000",
    "84"
  ];

  UserController userController = Get.find();
  CreditController creditController = Get.find();
  AuthenticationController authenticationController = Get.find();

  late final _nroOfForms;
  late List<TextEditingController> textControllers;

  @override
  void initState() {
    // le decimos al userController que se suscriba a los streams
    super.initState();
    userController.start();
    _nroOfForms = text.length;
    textControllers =
        List.generate(_nroOfForms, (_) => TextEditingController());
  }

  @override
  void dispose() {
    // le decimos al userController que se cierre los streams
    userController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("HomePage"),
            const Text(
                "Ingresa los datos de tu credito según lo que necesites"),
            IconButton(
                onPressed: () {
                  showCreditResumeMenuSheet(
                      MediaQuery.of(context).size.height, context);
                },
                icon: const Icon(
                  Icons.info,
                  size: 60,
                )),
            MyForm(
                texts: text,
                hintTexts: hintText,
                buttonText: "Simular",
                controllers: textControllers,
                onPressed: () {
                  try {
                    double? interestRate =
                        double.tryParse(textControllers[0].text);
                    double? salary = double.tryParse(textControllers[1].text);

                    double? initialValue =
                        double.tryParse(textControllers[2].text);
                    double? nCuotes = double.tryParse(textControllers[3].text);

                    creditController.calculateMaximumCreditAvailable(salary!);
                    creditController.createSimulationCredit(
                        initialValue!, nCuotes!, interestRate!);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Error parsing the fields")));
                  }

                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: CreditSimulationPage(saveButton: true),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.slideUp,
                  );
                }),
            ElevatedButton(
              onPressed: () {
                /*authenticationController.signUp(
                    email: "hola@hotmail.com", password: "123456");
                authenticationController.login("hola@hotmail.com", "123456");*/

                /* userController.createUser(
                    email: "hola2",
                    fullName: "hola2",
                    personalId: "XD",
                    uid: authenticationController.getUid());
                logInfo("this is HomePage Prueba: ${userController.userList}");
                logInfo(userController.userList);*/
              },
              child: const Text("Prueba", style: TextStyle(color: Colors.red)),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showCreditResumeMenuSheet(
      double height, BuildContext context) {
    return showMaterialModalBottomSheet(
        backgroundColor: Colors.white70,
        elevation: 0.1,
        useRootNavigator: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        builder: (context) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(height: height * 0.35, child: CreditInfoMenu()),
            ));
  }
}
