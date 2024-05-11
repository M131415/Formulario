import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/presentation/blocs/blocs.dart';
import 'package:formulario/presentation/screens/screens.dart';

void main() {
  runApp(const CubitsProvider());
}

class CubitsProvider extends StatelessWidget {
  const CubitsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FormCubit())
      ], 
      child: const MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Definimos la ruta inicial
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomeScreen(),
        'formulario': (BuildContext context) => const FormScreen(),
      }
    );
  }
}