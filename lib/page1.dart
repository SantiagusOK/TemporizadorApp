import 'package:contador/rutas.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cronometo'),
            const SizedBox(height: 40),
            FloatingActionButton.large(
              onPressed: () {
                rutasPaginas.goNamed(Pages.page2.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
