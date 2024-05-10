class Paciente{

  late int id;
  late String nombre;
  late int edad;
  late double altura;
  late String sexo;

  Paciente({
    required this.id,
    required this.nombre, 
    required this.edad, 
    required this.altura,
    required this.sexo,
    });

  // Convertir un Paciente a un mapa para la inserción en la base de datos
  //La clave primaria id se genera de forma automática
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'edad': edad,
      'altura': altura,
      'sexo': sexo,
    };
  }

  // Constructor para crear un Paciente desde un mapa 
  // recuperado de la base de datos
  Paciente.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre = map['nombre'];
    edad = map['telefono'];
    altura = map['nombre'];
    sexo = map['telefono'];
  }

}