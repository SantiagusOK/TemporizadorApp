import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Temporizador',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool botonesVisible = true;
  bool habilitarPausar = false;
  bool pausarT = false;
  int min = 00;
  int seg = 00;
  double letraSize = 113;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              botonesVisible
                  ? ElevatedButton(
                      onPressed: () {
                        aumentarValores('m++');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor:
                              const Color.fromARGB(255, 170, 170, 170),
                          fixedSize: const Size(100, 100)),
                      child: const Icon(
                        Icons.keyboard_double_arrow_up,
                        color: Colors.white,
                      ))
                  : Container(),
              const SizedBox(width: 65),
              botonesVisible
                  ? ElevatedButton(
                      onPressed: () {
                        aumentarValores('s++');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor:
                              const Color.fromARGB(255, 170, 170, 170),
                          fixedSize: const Size(100, 100)),
                      child: const Icon(
                        Icons.keyboard_double_arrow_up,
                        color: Colors.white,
                      ))
                  : Container()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                child: Center(
                  child: ponerDosValoresMin()
                      ? Text('0$min',
                          style: TextStyle(
                              fontSize: letraSize, color: Colors.white))
                      : Text('$min',
                          style: TextStyle(
                              fontSize: letraSize, color: Colors.white)),
                ),
              ),
              Text(':',
                  style: TextStyle(fontSize: letraSize, color: Colors.white)),
              SizedBox(
                  width: 130,
                  child: Center(
                    child: ponerDosValoresSeg()
                        ? Text('0$seg',
                            style: TextStyle(
                                fontSize: letraSize, color: Colors.white))
                        : Text('$seg',
                            style: TextStyle(
                                fontSize: letraSize, color: Colors.white)),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              botonesVisible
                  ? ElevatedButton(
                      onPressed: () {
                        aumentarValores('m--');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor:
                              const Color.fromARGB(255, 170, 170, 170),
                          fixedSize: const Size(100, 100)),
                      child: const Icon(
                        Icons.keyboard_double_arrow_down,
                        color: Colors.white,
                      ))
                  : Container(),
              const SizedBox(width: 65),
              botonesVisible
                  ? ElevatedButton(
                      onPressed: () {
                        aumentarValores('s--');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor:
                              const Color.fromARGB(255, 170, 170, 170),
                          fixedSize: const Size(100, 100)),
                      child: const Icon(
                        Icons.keyboard_double_arrow_down,
                        color: Colors.white,
                      ))
                  : Container(),
            ],
          ),
          const SizedBox(height: 100),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                if (activarFuncioIniciar()) {
                  _showSnackBar(context);
                } else {
                  if (habilitarPausar) {
                    pausarTemporizador();
                  } else {
                    iniciarTemporizador();
                    pausarT = false;
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 124, 122, 105),
                  fixedSize: const Size(150, 150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
              child: habilitarPausar
                  ? const Text('PAUSAR', style: TextStyle(fontSize: 20))
                  : const Text('INICIAR', style: TextStyle(fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }

  void aumentarValores(String d) {
    setState(() {
      switch (d) {
        case 's++':
          seg = seg + 1;
          if (seg > 60) {
            seg = 60;
          }
        case 's--':
          seg = seg - 1;
          if (seg < 0) {
            seg = 0;
          }
        case 'm++':
          min = min + 1;
          if (min > 60) {
            min = 60;
          }
        case 'm--':
          min = min - 1;
          if (min < 0) {
            min = 0;
          }
      }
      ponerDosValoresMin();
      ponerDosValoresSeg();
    });
  }

  bool activarFuncioIniciar() {
    if (min == 0 && seg == 0) {
      return true;
    } else {
      return false;
    }
  }

  void _showSnackBar(BuildContext context) {
    // Muestra el SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Ingrese un valor',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Colors.red,
        duration: Duration(
            seconds: 3), // Opcional: establece la duración del SnackBar
      ),
    );
  }

  bool ponerDosValoresSeg() {
    String segString = seg.toString();
    int segLenght = segString.length;
    if (segLenght > 1) {
      return false;
    } else {
      return true;
    }
  }

  bool ponerDosValoresMin() {
    String minString = min.toString();
    int minLenght = minString.length;

    if (minLenght > 1) {
      return false;
    } else {
      return true;
    }
  }

  void pausarTemporizador() => pausarT = true;

  void iniciarTemporizador() {
    botonesVisible = false;
    habilitarPausar = true;
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      ponerDosValoresMin();
      ponerDosValoresSeg();
      if (habilitarPausar && pausarT) {
        setState(() {
          botonesVisible = true;
          habilitarPausar = false;
        });
        timer.cancel();
      }
      setState(() {
        if (min == 0 && seg == 0) {
          botonesVisible = true;
          habilitarPausar = false;
          timer.cancel();
        } else {
          seg = seg - 1;
          if (min > 0 && seg < 0) {
            min = min - 1;
            seg = 59;
          }
        }
      });
    });
  }
}
