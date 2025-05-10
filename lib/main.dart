import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                width: 275,
                child: TextField(
                  textAlign: TextAlign.end,
                  readOnly: true,
                  enabled: false,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text("AC")),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.backspace_outlined),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text("7")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("8")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("9")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("/")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text("4")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("5")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("6")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("x")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text("1")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("2")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("3")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("-")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text("0")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text(",")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("=")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: const Text("+")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
