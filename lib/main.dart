import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:programacao_mobile_avaliacao_01/classes/BotaoEstilos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  String entrada = '';
  String resultado = '';
  bool resultadoCalculado = false;

  final TextEditingController controladorTexto = TextEditingController();

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == "AC") {
        entrada = '';
        resultado = '';
        resultadoCalculado = false;
      } else if (valor == "⌫") {
        if (entrada.isNotEmpty) {
          entrada = entrada.substring(0, entrada.length - 1);
        }
      } else if (valor == "=") {
        calcularResultado();
      } else {
        if (resultadoCalculado && RegExp(r'[0-9]').hasMatch(valor)) {
          entrada = valor;
        } else {
          entrada += valor;
        }
        resultadoCalculado = false;
      }
      controladorTexto.text = entrada;
    });
  }

  void calcularResultado() {
    String expressao = entrada.replaceAll('x', '*').replaceAll(',', '.');

    try {
      final parser = ShuntingYardParser();
      final exp = parser.parse(expressao);
      final cm = ContextModel();
      final resultadoCalculadoValor = exp.evaluate(EvaluationType.REAL, cm);

      resultado = resultadoCalculadoValor.toString();
      entrada = resultado;
      controladorTexto.text = resultado;

      // Mover o cursor
      controladorTexto.selection = TextSelection.fromPosition(
        TextPosition(offset: controladorTexto.text.length),
      );

      resultadoCalculado = true;
    } catch (e) {
      resultado = 'Erro';
      entrada = '';
      controladorTexto.text = resultado;
      resultadoCalculado = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text(widget.title)),
      body: Container(
        color: const Color(0xFFC8E9E2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                  width: 275,
                  child: TextField(
                    controller: controladorTexto,
                    textAlign: TextAlign.end,
                    readOnly: true,
                    style: const TextStyle(
                      fontFamily: 'Digital7',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          //color: const Color.fromARGB(255, 90, 63, 54),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.yellow,
                          width: 2.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("AC"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("AC"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("⌫"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: Icon(Icons.backspace_outlined),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("7"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("7"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("8"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("8"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("9"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("9"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("/"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("/"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("4"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("4"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("5"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("5"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("6"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("6"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("x"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("x"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("1"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("1"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("2"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("2"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("3"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("3"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("-"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("-"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("0"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("0"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao(","),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text(","),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("="),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("="),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _pressionarBotao("+"),
                      style: BotaoEstilos.estiloPadrao(),
                      child: const Text("+"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
