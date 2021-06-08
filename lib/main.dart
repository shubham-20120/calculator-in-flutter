import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double tempNum = 0;
  String displayString = '', sign = '', fv = '', sv = '';
  void hitC() {}
  void doOperations(String btnVal) {
    if (btnVal == 'C') {
      fv = sv = '';
      sign = '';
      displayString = '';
      print('C printed');
    } else if (btnVal == '+' ||
        btnVal == '×' ||
        btnVal == '-' ||
        btnVal == '/') {
      displayString = displayString + ' ' + btnVal + ' ';
      sign = btnVal;
    } else if (btnVal == '=') {
      displayString = displayString + ' ' + btnVal;
      if (sign == '+') {
        displayString = displayString +
            ' ' +
            (double.parse(fv) + double.parse(sv)).toString();
        fv = displayString;
      } else if (sign == '-') {
        displayString = displayString +
            ' ' +
            (double.parse(fv) - double.parse(sv)).toString();
        fv = displayString;
      } else if (sign == '×') {
        displayString = displayString +
            ' ' +
            (double.parse(fv) * double.parse(sv)).toString();
        fv = displayString;
      } else if (sign == '/') {
        displayString = displayString +
            ' ' +
            (double.parse(fv) / double.parse(sv)).toString();
        fv = displayString;
      }
      sign = '';
    } else {
      //numbers
      displayString = displayString + btnVal;
      if (sign == '') {
        fv = fv + btnVal;
      } else {
        sv = btnVal;
      }
    }
    setState(() {
      displayString = displayString;
    });
  }

  Widget btnComponent(String btnVal) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          doOperations(btnVal);
        },
        padding: EdgeInsets.only(left: 20, right: 20, top: 17, bottom: 17),
        child: Text(
          btnVal,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PCalculator"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.all(10),
                child: Text(
                  '$displayString',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                btnComponent('1'),
                btnComponent('2'),
                btnComponent('3'),
                btnComponent('/'),
              ],
            ),
            Row(
              children: <Widget>[
                btnComponent('4'),
                btnComponent('5'),
                btnComponent('6'),
                btnComponent('×'),
              ],
            ),
            Row(
              children: <Widget>[
                btnComponent('7'),
                btnComponent('8'),
                btnComponent('9'),
                btnComponent('+'),
              ],
            ),
            Row(
              children: <Widget>[
                btnComponent('0'),
                btnComponent('.'),
                btnComponent('C'),
                btnComponent('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
