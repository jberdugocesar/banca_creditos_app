import 'package:flutter/material.dart';

class CreditInfoMenu extends StatelessWidget {
  const CreditInfoMenu({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Cuota máxima del prestamo"),
              const Text("Valor total a pagar: "),
              ElevatedButton(onPressed: () {}, child: const Text("Cerrar")),
            ],
          ),
        ),
      ),
    );
  }
}
