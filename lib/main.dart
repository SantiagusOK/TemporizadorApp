import 'package:contador/rutas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ejemplos 2do TSDdS IES 9-010',
      routerConfig: rutasPaginas,
    );
  }
}
