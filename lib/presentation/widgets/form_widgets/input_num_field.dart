import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLength;
  final int numeroMaximo;
  final int numeroMinimo;
  final Icon icon;
  final bool autofocus;

  const InputNumField(
    {super.key, 
    required this.controller, 
    required this.label,
    required this.maxLength, 
    required this.icon, 
    this.autofocus = false, 
    required this.numeroMaximo,
    required this.numeroMinimo,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: _validatorText,
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
      return "Por favor, ingrese un digito válido";
    }
    else if(value.isNotEmpty){
      final int numero = int.parse(value);
      if (numero >= numeroMaximo || numero <= numeroMinimo){
        return "El digito esta fuera del rango máximo";
      }
    }
    return null;
  }

}