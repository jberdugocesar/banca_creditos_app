import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  final String text;

  const CheckButton({super.key, required this.text});

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Checkbox(
            value: checkBoxValue,
            onChanged: (bool? newValue) {
              setState(() {
                checkBoxValue = newValue!;
              });
            },
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
