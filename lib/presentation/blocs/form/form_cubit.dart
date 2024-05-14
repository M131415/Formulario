import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/domain/entities/paciente.dart';
import 'package:formulario/presentation/data/data.dart';

class FormCubit extends Cubit<List<Map<String,dynamic>>>{

  FormCubit():super(miLista);

  // Insert a paciente and Update list
  void insertPaciente(Paciente paciente) {
    state.add(paciente.toMap());
    emit(List.from(state));
  }
  // Remove a paciente by id
  void deletePaciente(String id){
    state.removeWhere((lista) => lista['id'] == id);
    emit(List.from(state));
  }
}