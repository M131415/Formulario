import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;


  const CustomButtom({
    super.key, 
    required this.text, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:  const ButtonStyle(
        elevation: MaterialStatePropertyAll(2),
        backgroundColor: MaterialStatePropertyAll(Colors.purple),
        shape: MaterialStatePropertyAll(StadiumBorder())
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}