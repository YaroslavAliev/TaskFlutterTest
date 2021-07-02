import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Task Code'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var rng = Random();

  String RandColor(){
    var allowed = ['A', 'B', 'C', 'D', 'E', 'F', '0','1', '2', '3', '4', '5', '6', '7', '8', '9'], S = '#';
    while(S.length < 7){
      S += allowed[rng.nextInt(allowed.length)];
    }
    return S;
  }

  @override
  Widget build(BuildContext context) {
    String color = RandColor();
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: RaisedButton(
        color: HexColor(color),//HexColor(color)
        onPressed: () {
          setState(() {
            color = RandColor();
          });
        },
        child: Text('Hey there')
      ),
    );
  }
}


