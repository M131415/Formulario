import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLength;
  final Icon icon;
  final bool autofocus;

  const InputTextField(
    {super.key, 
    required this.controller, 
    required this.label,
    required this.maxLength, 
    required this.icon, 
    this.autofocus = false,
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 80,
            width: 350,
            child: TextFormField(
              controller: controller,
              maxLength: maxLength,
              validator: (value) {
                if (value == null || value.isEmpty || value.isAlphabetNumericSymbol()) {
                  controller.clear();
                  return 'Por favor ingrese un texto válido';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: label,
                hintText: "Ingrese su $label",
                prefixIcon: icon,
                border: const OutlineInputBorder(),
              ),
            ),
          );
  }
}