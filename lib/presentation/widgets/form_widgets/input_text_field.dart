import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLength;
  final Icon icon;
  final bool autofocus;

  const InputTextField({
    super.key, 
    required this.controller, 
    required this.label,
    required this.maxLength, 
    required this.icon, 
    this.autofocus = false,  
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 80,
            width: 350,
            child: TextFormField(
              controller: controller,
              maxLength: maxLength,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: _validatorText,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
              decoration: InputDecoration(
                labelText: label,
                hintText: "Ingrese su $label",
                prefixIcon: icon,
                border: const OutlineInputBorder(),
              ),
            ),
          );
  }


  String? _validatorText(String? value){

    if(value == null || value.trim().isEmpty){
      return "Por favor, ingrese un texto válido";
    }
    return null;
  }
}