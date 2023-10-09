import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  final List<String> texts;
  final List<String> hintTexts;
  final String buttonText;
  final Function onPressed;
  final Widget? bottomWidget;
  final List<TextEditingController?>? controllers;

  const MyForm(
      {required this.texts,
      required this.hintTexts,
      super.key,
      this.bottomWidget,
      required this.buttonText,
      required this.onPressed,
      this.controllers});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: widget.texts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: widget.controllers?[index],
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: widget.texts[index],
                        hintText: widget.hintTexts[index],
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        return null;
                      },
                    ),
                  );
                },
              ),
            ),
            widget.bottomWidget ?? const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onPressed();
                  }
                },
                child: Text(widget.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
