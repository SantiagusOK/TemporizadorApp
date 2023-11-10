import 'package:contador/class_contador.dart';
import 'package:contador/page3.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    ContadorApp contador = ContadorApp();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contador.aumentarValorSeg();
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(90, 50)),
                  child: const Text('+'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contador.aumentarValorMin();
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(90, 50)),
                  child: const Text('+'),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${contador.min2}${contador.min1}',
                    style: const TextStyle(fontSize: 100)),
                const Text(':', style: TextStyle(fontSize: 100)),
                Text(
                  '${contador.seg2}${contador.seg2}',
                  style: const TextStyle(fontSize: 100),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(90, 50)),
                  child: const Text('-'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(90, 50)),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
