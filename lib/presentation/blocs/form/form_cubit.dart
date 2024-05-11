import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/domain/entities/paciente.dart';

class FormCubit extends Cubit<List<Map<String,dynamic>>>{

  FormCubit():super([{"nombre": "Mau"}]);

   void insertContacto(Paciente paciente) {
    state.add(paciente.toMap());
  }
}