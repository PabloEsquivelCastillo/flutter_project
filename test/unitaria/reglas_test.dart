//Tipo: UNITARIAS- Se prueba una regla sin necesdidad de red (solo logica de negocio)

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/dominio/consumo.dart';

void main() {
  
  group('Historia 1: Registrar consumo', () {
    // test declara un caso unitario de preubas.  No se usa tester porque en este caso no hay pantallas
    test('Rechazar litros <= 0: la regla devuelve error', () {
      // Con 0 litros la regla debe devolver un mensaje de error(no null)
      expect(ReglaConsumo.validarLitros(0), isNotNull);
      expect(ReglaConsumo.validarLitros(-3), isNotNull);
    });


    test('Rechazar litros > 10000: la regla devuelve error', () {
      expect(ReglaConsumo.validarLitros(10001), isNotNull);
    });
    
    test('Aceptar litros en rango', () {
      expect(ReglaConsumo.validarLitros(5000), isNull);
      expect(ReglaConsumo.validarLitros(10000), isNull);
    });

    test('Rechazar Kwh <= 0: la regla devuelve error', () {
      expect(ReglaConsumo.validarKwh(0), isNotNull);
      expect(ReglaConsumo.validarKwh(-1), isNotNull);
    });

  });

  group('Historia 2: Ingresar correo', () {
    test('Rechazar correos no institucionales o con formato invalido: la regla devuelve false', () {
      expect(Reglacorreo.esInstitucional('@utez.edu.mx'), isFalse);
      expect(Reglacorreo.esInstitucional('usuario@gmail.com'), isFalse);
    });

    test('Aceptar correos con formato correcto: la regla devuelve true', () {
      expect(Reglacorreo.esInstitucional('usuario@utez.edu.mx'), isTrue);
    });
  });


  group('Historia 3: Meta semanal', () {


    test('Revisar si se acerca a la meta semanal', () {
      expect(MetaSemanal(100).seAcerca(80), isTrue);
    });

    test('Revisar si se no se acerca a la meta semanal', () {
      expect(MetaSemanal(100).seAcerca(79), isFalse);
    });
  });
}





/*
*  ACTIVIDAD
* 1.1 Rechazar litros sobre tope de 10k
* 1.2 Aceptar litros en rango
* 1.3 Rechazar Kwh menor o  igual acero
* 2. Crear otro grupo para 2da historia de usuario
*   2.1 Validar que solo pueda entrar con correo institucional
*   2.2 Rechazar correo de otro dominio
*   2.3 Rechazar el dominio sin usuario
* 3. Ver si se acerca a la meta semanal
* 3.2 Ver si no se acerca a la meta semanal
* */