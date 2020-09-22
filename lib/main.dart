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
  double _priceFood = 0;
  double _valuePrecisionFood = 0;
  double _totalAccount = 0;
  TextEditingController _priceFoodController = new TextEditingController();

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
  // final water

  //begin food
  void _addPriceFood(){
    setState(() {
      if(_priceFoodController.text == ''){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Price empty"),
              content: new Text("Please enter a valid value"),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      else{
        _priceFood = num.tryParse(_priceFoodController.text).toDouble();

        if(_priceFood == 0){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Price can't be 0"),
                content: new Text("Please enter a valid value"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          return;
        }

        double _finalPriceFood = _priceFood + _valuePrecisionFood;
        _valuePrecisionFood = num.parse(_finalPriceFood.toStringAsPrecision(4));
        print('$_finalPriceFood final');

        if(_valuePrecisionFood <= 0){
          _valuePrecisionFood = 0;
        }
      }
    });
  }
  //end food

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

                    SizedBox(width: 100, child: TextFormField(
                      controller: _priceFoodController,
                      decoration: new InputDecoration(labelText: "Enter food price"),
                      keyboardType: TextInputType.number,
                    )),
                    FloatingActionButton(
                      onPressed: _addPriceFood,
                      child: Icon(Icons.add),
                    ),
                    Spacer(),

                    Text(
                      'RS $_valuePrecisionFood',
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
