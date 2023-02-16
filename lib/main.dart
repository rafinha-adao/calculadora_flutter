import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController textController = TextEditingController();

  late double num1, num2, result;

  String action = '';

  void _insertInputValue(String value) {
    textController.text += value;
  }

  void _setAction(String action) {
    num1 = double.parse(textController.text);
    this.action = action;

    _clearInput();
  }

  void _clearInput() => textController.text = '';

  void _clearAction() => action = '';

  void _reset() {
    _clearInput();
    _clearAction();
  }

  void _deleteLastInput() {
    if (textController.text.isNotEmpty) {
      String text = textController.text;
      textController.text = text.substring(0, text.length - 1);
    }
  }

  void _calculate() {
    if (action != '') {
      num2 = double.parse(textController.text);
      switch (action) {
        case 'sum':
          result = num1 + num2;
          break;
        case 'sub':
          result = num1 - num2;
          break;
        case 'mul':
          result = num1 * num2;
          break;
        case 'div':
          result = num1 / num2;
          break;
      }
      num1 = result;
      _clearInput();
      textController.text = result.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: TextField(
                            readOnly: true,
                            enabled: false,
                            controller: textController,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: FilledButton.tonal(
                            onPressed: () => _deleteLastInput(),
                            child: const Icon(CupertinoIcons.delete_left),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: FilledButton.tonal(
                            onPressed: () => _setAction('div'),
                            child: const Icon(CupertinoIcons.divide),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('7'),
                            child: const Text('7'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('8'),
                            child: const Text('8'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('9'),
                            child: const Text('9'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: FilledButton.tonal(
                            onPressed: () => _setAction('mul'),
                            child: const Icon(CupertinoIcons.xmark),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('4'),
                            child: const Text('4'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('5'),
                            child: const Text('5'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('6'),
                            child: const Text('6'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: FilledButton.tonal(
                            onPressed: () => _setAction('sub'),
                            child: const Icon(CupertinoIcons.minus),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('1'),
                            child: const Text('1'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('2'),
                            child: const Text('2'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('3'),
                            child: const Text('3'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: FilledButton.tonal(
                            onPressed: () => _setAction('sum'),
                            child: const Icon(CupertinoIcons.plus),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: FilledButton.tonal(
                            onPressed: () => _reset(),
                            child: const Icon(CupertinoIcons.restart),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => _insertInputValue('0'),
                            child: const Text('0'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: FilledButton(
                            onPressed: () => _calculate(),
                            child: const Icon(CupertinoIcons.equal),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
