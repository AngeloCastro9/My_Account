import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int _counterChopp = 0;
  double _totalAccountChopp= 0;
  double _valuePrecisionChopp = 0;
  int _counterWater = 0;
  double _totalAccountWater= 0;
  double _valuePrecisionWater = 0;

  // begin chopp
  void _incrementCounterChopp() {
    setState(() {
      _counterChopp++;
      _totalAccountChopp = (_counterChopp * 4.9);
      _valuePrecisionChopp = num.parse(_totalAccountChopp.toStringAsPrecision(4));
    });
  }

  void _decrementCounterChopp() {
    setState(() {
      _counterChopp--;
      _totalAccountChopp = _counterChopp * 4.9;
      _valuePrecisionChopp = num.parse(_totalAccountChopp.toStringAsPrecision(4));
      if(_counterChopp <= 0){
        _counterChopp = 0;
      }
      if(_valuePrecisionChopp <= 0){
        _valuePrecisionChopp = 0;
      }
    });
  }
  // final chopp

  // begin water
  void _incrementCounterWater() {
    setState(() {
      _counterWater++;
      _totalAccountWater = (_counterWater * 6.9);
      _valuePrecisionWater = num.parse(_totalAccountWater.toStringAsPrecision(4));
    });
  }

  void _decrementCounterWater() {
    setState(() {
      _counterWater--;
      _totalAccountWater = _counterWater * 6.9;
      _valuePrecisionWater = num.parse(_totalAccountWater.toStringAsPrecision(4));
      if(_counterWater <= 0){
        _counterWater = 0;
      }
      if(_valuePrecisionWater <= 0){
        _valuePrecisionWater = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          alignment: Alignment.center,
          child: new Column(
            children: [
              new Container(
                height: 130.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: _decrementCounterChopp,
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                      Image.asset(
                        'assets/images/chopp.png',
                        fit: BoxFit.cover,
                      ),
                      FloatingActionButton(
                        onPressed: _incrementCounterChopp,
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                      Spacer(),
                      Text(
                        '$_counterChopp',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Spacer(),
                      Text(
                        'RS $_valuePrecisionChopp',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                ),
              ),

              new Container(
                height: 130.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: _decrementCounterWater,
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    Image.asset(
                      'assets/images/water.png',
                      fit: BoxFit.cover,
                    ),
                    FloatingActionButton(
                      onPressed: _incrementCounterWater,
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                    Spacer(),
                    Text(
                      '$_counterWater',
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Spacer(),
                    Text(
                      'RS $_valuePrecisionWater',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),

              new Container(
                height: 130.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/food.png',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 100, child: TextField(
                      decoration: new InputDecoration(labelText: "Enter your number"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[

                      ],
                    )),
                    FloatingActionButton(
                      onPressed: _incrementCounterWater,
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                    Spacer(),

                    Text(
                      'RS $_valuePrecisionWater',
                      style: Theme.of(context).textTheme.display1,
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
