import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/presentation/registro_page.dart';

import '../dominio/consumo.dart';
import 'datos/consumo_repository.dart';

void main() {
  runApp(NewProject(repositorio: MemoriaConsumoRepository()));
}

class NewProject extends StatelessWidget {
  const NewProject({super.key, required this.repositorio});

  final ConsumoRepository repositorio;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTrack',
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: RegistroPage(repositorio: repositorio),
    );
  }
}