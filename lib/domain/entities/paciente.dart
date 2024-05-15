class Paciente{

  late String id;
  late String nombre;
  late String edad;
  late String altura;
  late String ocupacion;

  Paciente({
    required this.id,
    required this.nombre, 
    required this.edad, 
    required this.altura,
    required this.ocupacion,
    });

  // Convertir un Paciente a un mapa para la inserción en la base de datos
  //La clave primaria id se genera de forma automática
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'edad': edad,
      'altura': altura,
      'ocupacion': ocupacion,
    };
  }

  // Constructor para crear un Paciente desde un mapa 
  // recuperado de la base de datos
  Paciente.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre = map['nombre'];
    edad = map['edad'];
    altura = map['altura'];
    ocupacion = map['ocupacion'];
  }

}