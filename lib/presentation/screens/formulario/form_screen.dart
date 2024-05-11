import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario"),
      ),
      body: const FormScreenView(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.arrow_back_ios),
        label: const Text("Regresar"),
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

  final TextEditingController _nombreController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              // Add TextFormFields and ElevatedButton here.
              const SizedBox(height: 50),
                SizedBox(
                  height: 100,
                  width: 300,
                  child: TextFormField(
                    controller: _nombreController,
                    maxLength: 40,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrse un nombre válido';
                      }
                      return null;
                    },
                    decoration:  const InputDecoration(
                      labelText: "Nombre",
                      hintText: "Ingresa tu nombre",
                      prefixIcon: Icon(Icons.person_2),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Text(_nombreController.text),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Registrando usuario'),
                          action: SnackBarAction(
                            label: 'Deshacer',
                            onPressed: () {
                              // Some code to undo the change.
                              setState(() {
                                _nombreController.text = "";
                              });
                            },
                          ),
                        ),
                      );
                      setState(() {_nombreController.text;});
                    }
                  },
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ],
    );
        
  }
}