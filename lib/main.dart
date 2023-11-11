import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
  int min = 00;
  int seg = 00;
  double letra_size = 113;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    aumentarValores('m++');
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(100, 100)),
                  child: Icon(Icons.keyboard_double_arrow_up)),
              SizedBox(width: 65),
              ElevatedButton(
                  onPressed: () {
                    aumentarValores('s++');
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(100, 100)),
                  child: Icon(Icons.keyboard_double_arrow_up))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                child: Center(
                  child: Text('$min', style: TextStyle(fontSize: letra_size)),
                ),
              ),
              Text(':', style: TextStyle(fontSize: letra_size)),
              SizedBox(
                  width: 130,
                  child: Center(
                    child: Text('$seg', style: TextStyle(fontSize: letra_size)),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    aumentarValores('m--');
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(100, 100)),
                  child: const Icon(Icons.keyboard_double_arrow_down)),
              const SizedBox(width: 65),
              ElevatedButton(
                  onPressed: () {
                    aumentarValores('s--');
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(100, 100)),
                  child: const Icon(Icons.keyboard_double_arrow_down))
            ],
          ),
        ],
      ),
    );
  }

  void aumentarValores(String d) {
    setState(() {
      switch (d) {
        case 's++':
          seg = seg + 5;
          if (seg >= 60) {
            seg = 59;
          }
        case 's--':
          seg = seg - 5;
          if (seg < 0) {
            seg = 0;
          }
          if (seg == 54) {
            seg = 55;
          }
        case 'm++':
          min = min + 5;
          if (min >= 60) {
            min = 59;
          }
        case 'm--':
          min = min - 5;
          if (min <= 0) {
            min = 0;
          }
          if (min == 54) {
            min = 55;
          }
      }
    });
  }
}
