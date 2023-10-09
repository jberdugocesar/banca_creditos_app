import 'package:flutter/material.dart';

class ButtonsColumnWidget extends StatelessWidget {
  final List<Function> onPressed;
  final List<String> buttonNames;

  const ButtonsColumnWidget(
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
