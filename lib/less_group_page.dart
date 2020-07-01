import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
        title: 'StatelessWidget与基础组件',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('StatelessWidget与基础组件'),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    'i am text',
                    style: textStyle,
                  ),
                  Icon(Icons.android, size: 50),
                  CloseButton(),
                  BackButton(),
                  Chip(
                    avatar: Icon(Icons.photo),
                    label: Text('Chip组件'),
                  ),
                  Divider(
                    height: 10,
                    indent: 10,
                    color: Colors.orange,
                  ),
                  Card(
                    color: Colors.pink,
                    elevation: 5,
                    child: Container(
                        padding: EdgeInsets.all(10), child: Text("I am card")),
                  ),
                  AlertDialog(title: Text('哈哈哈'), content: Text('你这个糙老头子坏得很'))
                ],
              ),
            )));
  }
}
