import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Consumption',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'My Consumption'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _totalAccount= 0;
  double _valuePrecision = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _totalAccount = (_counter * 4.9);
      _valuePrecision = num.parse(_totalAccount.toStringAsPrecision(4));
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _totalAccount = _counter * 4.9;
      _valuePrecision = num.parse(_totalAccount.toStringAsPrecision(4));
      if(_counter <= 0){
        _counter = 0;
      }
      if(_valuePrecision <= 0){
        _valuePrecision = 0;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 130.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            Image.asset(
              'assets/images/chopp.png',
              fit: BoxFit.cover,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            Spacer(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Spacer(),
            Text(
              'RS $_valuePrecision',
                style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
    );
  }
}
