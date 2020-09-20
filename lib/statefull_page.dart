import 'package:flutter/material.dart';

class StateFullPage extends StatefulWidget {
  @override
  _StateFullPageState createState() => _StateFullPageState();
}

class _StateFullPageState extends State<StateFullPage> {
  int _currentIndex = 0;
  TextStyle textStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StatefullWidget与基础组件',
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
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.grey),
                    activeIcon: Icon(Icons.home, color: Colors.blue),
                    title: Text('首页')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list, color: Colors.grey),
                    activeIcon: Icon(Icons.list, color: Colors.blue),
                    title: Text('列表'))
              ],
            ),
            floatingActionButton:
                FloatingActionButton(onPressed: null, child: Text('点我')),
            body: Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Image.network("http://www.devio.org/img/avatar.png",
                      width: 100, height: 100),
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
