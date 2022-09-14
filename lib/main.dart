import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FizzBuzz Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FizzBuzz Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Logic {
  String getLabel(int i) {
    String label = "";
    if (i % 3 == 0 && i % 5 == 0) {
      label = "FizzBuzz";
    } else if (i % 3 == 0) {
      label = "Fizz";
    } else if (i % 5 == 0) {
      label = "Buzz";
    } else {
      label = i.toString();
    }
    return label;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _number = 1000;  // defaults to 1000

  List<Widget> _displayList() {
    List<Widget> l = <Widget>[];
    Logic logic = Logic();
    for (int i = 1; i<=_number; i++) {
      l.add(
        SizedBox(
          height: 20,
          child: Center(child: Text(logic.getLabel(i)))
        ),
      );
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "User input",
              ),
              keyboardType: TextInputType.number,
              maxLength: 4,
              onChanged: (value) {
                setState(() {
                  try {
                    _number = int.parse(value);
                  } catch (e) {
                    print(e); // TODO log
                    _number = 0;
                  }
                });
              },
            ),
            Expanded(
              child: ListView(
                children: _displayList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
