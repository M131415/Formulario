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
        backgroundColor: Colors.purple[200],
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

  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _edadCtrl = TextEditingController();
  final TextEditingController _alturaCtrl = TextEditingController();
  final TextEditingController _sexoCtrl = TextEditingController();

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
                  controller: _nombreCtrl, 
                  label: "Nombre", 
                  maxLength: 45, 
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                InputNumField(
                  controller: _edadCtrl, 
                  label: "Edad", 
                  maxLength: 3, 
                  icon: const Icon(Icons.calendar_today)
                ),
                InputNumField(
                  controller: _alturaCtrl, 
                  label: "Altura (cm)", 
                  maxLength: 45, 
                  icon: const Icon(Icons.height_sharp),
                ),
                const SizedBox(height: 10),
                InputTextField(
                  controller: _sexoCtrl, 
                  label: "Sexo", 
                  maxLength: 10, 
                  icon: const Icon(Icons.directions_walk)
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final mau = Paciente(id: 122, nombre: _nombreCtrl.text.trim(), edad: _edadCtrl.text.trim(), altura: _alturaCtrl.text.trim(), sexo: _sexoCtrl.text.trim());
                      formCubit.insertPaciente(mau);
                      _formKey.currentState!.reset();
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Registrando usuario'),
                          action: SnackBarAction(
                            label: 'Deshacer',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ),
                      );
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