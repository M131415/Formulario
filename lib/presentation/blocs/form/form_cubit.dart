import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/domain/entities/paciente.dart';
import 'package:formulario/presentation/data/data.dart';

class FormCubit extends Cubit<List<Map<String,dynamic>>>{

  FormCubit():super(miLista);

  void insertPaciente(Paciente paciente) {
    state.add(paciente.toMap());
    emit(List.from(state));
  }
}