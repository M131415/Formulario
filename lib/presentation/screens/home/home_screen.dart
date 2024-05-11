import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/form/form_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: const _HomeScreenView(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.person),
        label: const Text("Registrar paciente"),
        onPressed: () {
          Navigator.pushNamed(context, 'formulario');
        } ,
    )
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {

    final formCubit = context.watch<FormCubit>();

    return Center(
      child: ListView.builder(
          itemCount: formCubit.state.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Nombre: ${formCubit.state[index]["nombre"]}'),
            );
          },
        ),
    );
  }
}