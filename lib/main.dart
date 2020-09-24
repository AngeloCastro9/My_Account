import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Account',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'My Account'),
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
  int _counterDraftBeer = 0;
  double _totalAccountDraftBeer= 0;
  double _valuePrecisionDraftBeer = 0;
  int _counterWater = 0;
  double _totalAccountWater= 0;
  double _valuePrecisionWater = 0;
  double _priceFood = 0;
  double _valuePrecisionFood = 0;
  double _priceOthers = 0;
  double _valuePrecisionOthers = 0;
  double _totalAccount = 0;
  double _totalAccountPrecision = 0;
  TextEditingController _priceFoodController = new TextEditingController();
  TextEditingController _priceOthersController = new TextEditingController();

  void totalAccount(){
    setState(() {
      _totalAccount = _valuePrecisionDraftBeer + _valuePrecisionWater + _valuePrecisionFood + _valuePrecisionOthers;
      _totalAccountPrecision = num.parse(_totalAccount.toStringAsPrecision(4));
    });
  }


  // begin DraftBeer
  void _incrementCounterDraftBeer() {
    setState(() {
      _counterDraftBeer++;
      _totalAccountDraftBeer = (_counterDraftBeer * 4.9);
      _valuePrecisionDraftBeer = num.parse(_totalAccountDraftBeer.toStringAsPrecision(4));
      totalAccount();
    });
  }

  void _decrementCounterDraftBeer() {
    setState(() {
      _counterDraftBeer--;
      _totalAccountDraftBeer = _counterDraftBeer * 4.9;
      _valuePrecisionDraftBeer = num.parse(_totalAccountDraftBeer.toStringAsPrecision(4));
      if(_counterDraftBeer <= 0){
        _counterDraftBeer = 0;
      }
      if(_valuePrecisionDraftBeer < 0){
        _valuePrecisionDraftBeer = 0;
      }
      totalAccount();
    });
  }
  // final DraftBeer

  // begin water
  void _incrementCounterWater() {
    setState(() {
      _counterWater++;
      _totalAccountWater = (_counterWater * 5.9);
      _valuePrecisionWater = num.parse(_totalAccountWater.toStringAsPrecision(4));
      totalAccount();
    });
  }

  void _decrementCounterWater() {
    setState(() {
      _counterWater--;
      _totalAccountWater = _counterWater * 5.9;
      _valuePrecisionWater = num.parse(_totalAccountWater.toStringAsPrecision(4));
      if(_counterWater <= 0){
        _counterWater = 0;
      }
      if(_valuePrecisionWater <= 0){
        _valuePrecisionWater = 0;
      }
      totalAccount();
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

        if(_priceFood == 0 || _priceFood < 0){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Price can't be 0 or negative"),
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
      }
      totalAccount();
    });
  }
  //end food

  //begin others
  void _addPriceOthers(){
    setState(() {
      if(_priceOthersController.text == ''){
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
        _priceOthers = num.tryParse(_priceOthersController.text).toDouble();

        if(_priceOthers == 0 || _priceOthers < 0){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Price can't be 0 or negative"),
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

        double _finalPriceOthers = _priceOthers + _valuePrecisionOthers;
        _valuePrecisionOthers = num.parse(_finalPriceOthers.toStringAsPrecision(4));
      }
      totalAccount();
    });
  }
  //end others

  void clearAll(){
    setState(() {
      _totalAccount = 0;
      _valuePrecisionDraftBeer = 0;
      _valuePrecisionWater = 0;
      _valuePrecisionFood = 0;
      _valuePrecisionOthers = 0;
      _counterDraftBeer = 0;
      _counterWater = 0;
      _totalAccountPrecision = 0;
      _priceFoodController.clear();
      _priceOthersController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomPadding  : false,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          alignment: Alignment.center,
          child: new Column(
            children: [
              new Container(
                height: 130.0,
                width: 250,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      FloatingActionButton(
                        onPressed: _decrementCounterDraftBeer,
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                      Image.asset(
                        'assets/images/draftBeer.png',
                        fit: BoxFit.cover,
                      ),
                      FloatingActionButton(
                        onPressed: _incrementCounterDraftBeer,
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                      Spacer(),
                      Text(
                        '$_counterDraftBeer',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                ),
              ),

              new Container(
                height: 130.0,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
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
                  ],
                ),
              ),

              new Container(
                height: 110.0,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image.asset(
                      'assets/images/food.png',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 100, child: TextFormField(
                      controller: _priceFoodController,
                      decoration: new InputDecoration(labelText: "Price"),
                      keyboardType: TextInputType.number,
                    )),

                    FloatingActionButton(
                      onPressed: _addPriceFood,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),

              new Container(
                height: 110.0,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image.asset(
                      'assets/images/others.png',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 100, child: TextFormField(
                      controller: _priceOthersController,
                      decoration: new InputDecoration(labelText: "Price"),
                      keyboardType: TextInputType.number,
                    )),
                    FloatingActionButton(
                      onPressed: _addPriceOthers,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),

              new Container(
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TOTAL: RS $_totalAccountPrecision',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),

              new Container(
                height: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: clearAll,
                      label: Text('Clear'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}