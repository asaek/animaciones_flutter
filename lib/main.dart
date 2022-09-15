import 'package:animaciones_cero/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _fontSize = 10;
  Color _color = Colors.blue;
  double _containerSize = 70;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _fontSize += 5;
      _containerSize += 20;
      if (_counter.isEven) {
        _color = Colors.red;
      } else {
        _color = Colors.blue;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter++;
      _fontSize += 5;
      _containerSize += 20;
      if (_counter.isEven) {
        _color = Colors.red;
      } else {
        _color = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          color: Colors.amber,
          padding: const EdgeInsets.all(20),
          duration: const Duration(milliseconds: 400),
          height: _containerSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'You have pushed:',
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: _fontSize,
                      color: _color,
                    ),
                child: Text(
                  '$_counter',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
