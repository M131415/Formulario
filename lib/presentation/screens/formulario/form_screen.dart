import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/domain/entities.dart';
import 'package:formulario/presentation/blocs/form/form_cubit.dart';
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

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final formCubit = context.watch<FormCubit>();

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
                  controller: _edadController, 
                  label: "Edad", 
                  maxLength: 3, 
                  icon: const Icon(Icons.work)
                ),
                InputTextField(
                  controller: _alturaController, 
                  label: "Altura", 
                  maxLength: 45, 
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                InputTextField(
                  controller: _sexoController, 
                  label: "Sexo", 
                  maxLength: 10, 
                  icon: const Icon(Icons.work)
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {

                      formCubit.insertContacto(_agregarPaciente());

                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Registrando usuario'),
                          action: SnackBarAction(
                            label: 'Deshacer',
                            onPressed: () {
                              // Some code to undo the change.
                              //setState(() {});
                            },
                          ),
                        ),
                      );
                      //setState(() {});
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
  Paciente _agregarPaciente(){
    String nombre = _nombreController.text;
    String edad = _edadController.text;
    String altura = _alturaController.text;
    String sexo = _sexoController.text;

    Paciente nuevoPaciente = Paciente(id: 122, nombre: nombre, edad: edad, altura: altura, sexo: sexo);
    _edadController.clear();
    _alturaController.clear();
    _sexoController.clear();
    return nuevoPaciente;
  }
}