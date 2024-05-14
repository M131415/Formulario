import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/form/form_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pacientes'),
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
      child: BlocBuilder<FormCubit, List<Map<String,dynamic>>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index]["nombre"]),
                subtitle: Text(state[index]["id"]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: ()=>{formCubit.deletePaciente(state[index]["id"])},
                    ),
                  ],
                ),
              );
            },
          );
        },
      )
    );
  }
}