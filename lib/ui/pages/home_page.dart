import 'package:banca_creditos_app/ui/pages/credit_resume_menu.dart';
import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> text = [
    "Tipo de Credito",
    "Salario Base",
    "",
    "cantidad de meses"
  ];
  final List<String> hintText = [
    "Selecciona el tipo de credito",
    "\$ 10.000.000",
    "\$ 0",
    "48"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("HomePage"),
          const Text("Ingresa los datos de tu credito según lo que necesites"),
          SizedBox(
            height: 500,
            child: MyForm(
                texts: text,
                hintTexts: hintText,
                buttonText: "Simular",
                onPressed: () {
                  double height = MediaQuery.of(context).size.height;
                  showCreditResumeMenuSheet(height, context);
                }),
          )
        ],
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
              child: SizedBox(
                  height: height * 0.35, child: const CreditResumeMenu()),
            ));
  }
}
