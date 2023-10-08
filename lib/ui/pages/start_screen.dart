import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.passthrough,
        children: [
          BackgroundSlider(),
          Container(
              constraints: BoxConstraints(minHeight: 0, maxHeight: 200),
              color: Colors.black,
              child: CreateButtons(
                const ["Login", "Register"],
                [
                  () async => await Get.toNamed("/login"),
                  () async => await Get.toNamed("/register")
                ],
              ))
        ],
      ),
    );
  }
}

class CreateButtons extends StatelessWidget {
  final List<Function> onPressed;
  final List<String> buttonNames;

  const CreateButtons(
    this.buttonNames,
    this.onPressed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: buttonNames.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () =>
                // Puedes pasar el índice del botón como argumento a la función onPressed.
                onPressed[index](),
            child: Text(buttonNames[index]),
          ),
        );
      },
    );
  }
}

class BackgroundSlider extends StatelessWidget {
  const BackgroundSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 800,
          child: Center(child: Text("ayooo")),
        ),
      ),
    );
  }
}
