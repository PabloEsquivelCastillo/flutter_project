//Importación de componentes de interfaz
import 'package:flutter/material.dart';
//Importación
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/datos/consumo_repository.dart';
import 'package:new_project/presentation/registro_page.dart';

// función auxiliar que nos permite construir la pantalla a probar
Widget pantalla() => MaterialApp(home: RegistroPage(repositorio: MemoriaConsumoRepository()));

// punto de entrada aquí se declaran todos los casos de prueba del archivo
void main(){

  // CASO 1: litros vacios
  testWidgets('Con litros vacios se lee el mensaje y la pantalla de resumen no aparece', (teste) async {

    // Dibuja la pantalla de registro, como si el usuario
    await teste.pumpWidget(pantalla());
  },);
}