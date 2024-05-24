import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final IconData icon;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool isPassword;

  const CustomInput({
    super.key, 
    required this.icon, 
    required this.placeholder, 
    required this.controller, 
    this.keyboard = TextInputType.text, 
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
            blurRadius: 5,
          )
        ]
      ),
      child: TextFormField(
        validator: _validatorText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboard,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: Icon(icon),
          hintText: placeholder,
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