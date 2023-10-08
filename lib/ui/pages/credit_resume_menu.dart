import 'package:flutter/material.dart';

class CreditResumeMenu extends StatelessWidget {
  const CreditResumeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("HOLA"),
              Text("MAS HOLA"),
              ElevatedButton(
                  onPressed: () => Table(), child: Text("Continuar")),
            ],
          ),
        ),
      ),
    );
  }
}
