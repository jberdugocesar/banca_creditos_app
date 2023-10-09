import 'package:banca_creditos_app/ui/widgets/button_column.dart';
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
          const BackgroundSlider(),
          Container(
              constraints: const BoxConstraints(minHeight: 50, maxHeight: 200),
              color: Colors.black,
              child: ButtonsColumnWidget(
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



class BackgroundSlider extends StatelessWidget {
  const BackgroundSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height,
          child: const Center(child: Text("Start Screen")),
        ),
      ),
    );
  }
}
