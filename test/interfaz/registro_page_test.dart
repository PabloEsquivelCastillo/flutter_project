//Importación de componentes de interfaz
import 'package:flutter/material.dart';
//Importación
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/datos/consumo_repository.dart';
import 'package:new_project/presentation/registro_page.dart';
import 'package:new_project/presentation/resumen_page.dart';

// función auxiliar que nos permite construir la pantalla a probar
Widget pantalla() => MaterialApp(home: RegistroPage(repositorio: MemoriaConsumoRepository()));

// punto de entrada aquí se declaran todos los casos de prueba del archivo
void main(){

  // CASO 1: litros vacios
  testWidgets('Con litros vacios se lee el mensaje y la pantalla de resumen no aparece', (tester) async {

    // Dibuja la pantalla de registro, como si el usuario
    await tester.pumpWidget(pantalla());

    // Escribir 3 solo en el campo kwh, el de litros se deja vacío a proposito para el test
    await tester.enterText(find.byKey(const Key('campoKwh')), '3');

    // Dar click al boton de continuar en el formulario, que dispara la validación del mismo
    await tester.tap(find.text('Continuar'));

    //Esperar a que la pantall haga build nuevamente para renderizar lo nuevo
    await tester.pumpAndSettle();

    //Verificar que aparece exactamente el texto separado una vez se dan las validaciones
    expect(find.text('Escribe los litros'), findsOneWidget);

    // Verificar que no se navego a la pantalla siguiente
    expect(find.byType(ResumenPage), findsNothing);
  });

  // CASO 2: Litros en 0
  testWidgets('Con los litros en cero se lee el mensaje de rango', (tester) async {
    await tester.pumpWidget(pantalla());

    await tester.enterText(find.byKey(const Key('campoLitros')),'0');

    await tester.enterText(find.byKey(const Key('campoKwh')),'3');

    await tester.tap(find.text('Continuar'));

    await tester.pumpAndSettle();

    expect(find.text('Los litros deben ser mayores a cero'), findsOneWidget);

    expect(find.byType(ResumenPage), findsNothing);


  });
}