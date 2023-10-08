import 'package:banca_creditos_app/ui/bottom_navbar.dart';
import 'package:banca_creditos_app/ui/pages/credit_history.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SaveCreditConfirmationMenu extends StatelessWidget {
  const SaveCreditConfirmationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("HOLA"),
              const Text("MAS HOLA"),
              ElevatedButton(
                  onPressed: () {
                    var snackBar = const SnackBar(
                        content: Text('Simulación de credito guardada'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    
                  },
                  child: const Text("Guardar")),
              ElevatedButton(onPressed: () {}, child: const Text("Cancelar")),
            ],
          ),
        ),
      ),
    );
  }
}
