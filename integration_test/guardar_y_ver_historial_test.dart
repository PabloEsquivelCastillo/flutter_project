import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// importación para pruebas de integración
import 'package:integration_test/integration_test.dart';
import 'package:new_project/datos/consumo_repository.dart';
import 'package:new_project/main.dart';



void main() {


  // Conectar el emuladoor para poder hacer pruebas, tener un emulador es obligatorio ya que estas pruebas no se ejecutan sin el
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();


  // Declarar el caso de prueba de los widgets
  testWidgets('Tras confirmar el historial lista del laboratorio, litrso y kwh de esa caputar', (tester) async {
    NewProject(repositorio: MemoriaConsumoRepository());

    // PASO 1: Caputar de datos en la pantalla de registro consumo

    await tester.enterText(find.byKey(const Key('campoLitros')), '12.5');

    await tester.enterText(find.byKey(const Key('campoKwh')), '3.2');

    await tester.tap(find.text('Continuar'));

    await tester.pumpAndSettle();


    await tester.tap(find.text('Confirmar'));

    await tester.pumpAndSettle();

    expect(find.text('Historial'), findsOneWidget);

    expect(find.text('Lab Quimica'), findsOneWidget);

    expect(find.text('12.5 L 3.2 kWh'), findsOneWidget);

  });
}