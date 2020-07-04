import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpage extends StatefulWidget {
  @override
  _SharedpageState createState() => _SharedpageState();
}

class _SharedpageState extends State<Sharedpage> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('futureBuilder使用技巧'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _incrementCount,
              child: Text('incrementCounter'),
            ),
            RaisedButton(
              onPressed: _getCounter,
              child: Text('getCounter'),
            ),
            Text(
              countString,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              localCount,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  _incrementCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + "1";
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
