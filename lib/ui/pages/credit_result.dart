import 'package:flutter/material.dart';

class CreditResultPage extends StatelessWidget {
  const CreditResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("HOLA"),
          Text("MAS HOLA"),
          ElevatedButton(onPressed: () => Table(), child: Text("Continuar")),
        ],
      ),
    );
  }
}
