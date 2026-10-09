// Todo lo que se encuentra dentro del dominio se prueba con pruebas unitarias : sin pantalla y sin red

const laboratoriosUtez = ['Lab Quimica', 'Lab Redes', 'Lab Fisica'];


class Consumo {
  const Consumo ({
    required this.laboratorio,
    required this.litros,
    required this.kwh,
});

  final String laboratorio;
  final double litros;
  final double kwh;
}


class ReglaConsumo {
    static const topeLitros = 10000.0;
    static const topeKwh = 500.0;




    static String? validarLitros(double? litros) {
      if(litros == null) return 'Escribe los litros';
      if(litros <= 0) return 'Los litros deben ser mayores que 0';
      if(litros > topeLitros) return 'Los litros superan el tope';
      return null;
    }


    static String? validarKwh(double? kwh) {
      if(kwh == null) return 'Escribe los kWh';
      if(kwh <= 0) return 'Los kWh deben ser mayores que cero';
      if(kwh > topeKwh) return 'Los kWh superar el tope';
      return null;
    }
}

class Reglacorreo {
  static bool esInstitucional(String correo) {
    final limpio = correo.trim().toLowerCase();
    return limpio.endsWith('@utez.edu.mx') && limpio.length > 12;
  }
}


class MetaSemanal {
  const MetaSemanal(this.litrosMeta);

  final double litrosMeta;

  bool seAcerca(double litrosConsumidos) =>
      litrosConsumidos >= litrosMeta * 0.8;
}




