import 'package:banca_creditos_app/ui/pages/credit_info_menu.dart';
import 'package:banca_creditos_app/ui/pages/credit_simulation.dart';
import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("HomePage"),
            const Text(
                "Ingresa los datos de tu credito según lo que necesites"),
            SizedBox(
              height: 500,
              child: MyForm(
                  texts: text,
                  hintTexts: hintText,
                  buttonText: "Simular",
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const CreditSimulationPage(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.slideUp,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
