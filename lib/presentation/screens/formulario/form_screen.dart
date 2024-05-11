import 'package:flutter/material.dart';
import 'package:formulario/presentation/widgets/widgets.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario"),
        backgroundColor: Colors.cyan,
      ),
      body: const FormScreenView(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.arrow_back_rounded),
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
    final TextEditingController _ocupacionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
          children: [
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Add TextFormFields and ElevatedButton here.
                const SizedBox(height: 60),
                InputTextField(
                  controller: _nombreController, 
                  label: "Nombre", 
                  maxLength: 45, 
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                InputTextField(
                  controller: _ocupacionController, 
                  label: "Ocupación", 
                  maxLength: 30, 
                  icon: const Icon(Icons.work)
                ),
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
                                _nombreController.value;
                              });
                            },
                          ),
                        ),
                      );
                      setState(() {
                        _nombreController.clear();
                        _ocupacionController.clear();
                        });
                    }
                  },
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ],
      ) 
    );   
  }
}