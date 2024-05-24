import 'package:flutter/material.dart';
import 'package:formulario/presentation/widgets/widgets.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario"),
        backgroundColor: Colors.purple[200],
      ),
      body: const FormScreenView(),
      backgroundColor: const Color(0xffF2F2F2),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context)),
    );
  }
}

class FormScreenView extends StatefulWidget {
  const FormScreenView({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<FormScreenView> {

  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _edadCtrl = TextEditingController();
  final TextEditingController _alturaCtrl = TextEditingController();
  final TextEditingController _ocupacionCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Center(
        child: ListView(
          children: [
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  CustomInput(
                    icon: Icons.person, 
                    placeholder: "Nombre", 
                    controller: _nombreCtrl
                  ),
                  CustomInput(
                    icon: Icons.calendar_month, 
                    placeholder: "Edad", 
                    controller: _edadCtrl,
                    keyboard: TextInputType.number,
                  ),
                  CustomInput(
                    icon: Icons.height, 
                    placeholder: "Altura", 
                    controller: _alturaCtrl,
                    keyboard: TextInputType.number,
                  ),
                  CustomInput(
                    icon: Icons.work, 
                    placeholder: "Ocupacion", 
                    controller: _ocupacionCtrl
                  ),
                  CustomButtom(
                    text: 'Registrar',
                    onPressed: (){}
                  )
                ],
              ),
            ),
          ),
        ],
      ) 
    );   
  }
}