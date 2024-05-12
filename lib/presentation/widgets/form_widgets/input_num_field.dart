import 'package:flutter/material.dart';

class InputNumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLength;
  final Icon icon;
  final bool autofocus;

  const InputNumField(
    {super.key, 
    required this.controller, 
    required this.label,
    required this.maxLength, 
    required this.icon, 
    this.autofocus = false,
    }
  );

  bool validatorString(String value){

    
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 80,
            width: 350,
            child: TextFormField(
              controller: controller,
              maxLength: maxLength,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
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