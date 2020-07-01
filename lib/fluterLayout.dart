import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
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
                  Row(
                    children: <Widget>[
                      ClipOval(
                          child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                            "http://www.devio.org/img/avatar.png"),
                      )),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            "http://www.devio.org/img/avatar.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                      )
                    ],
                  ),
                  Image.network("http://www.devio.org/img/avatar.png",
                      width: 100, height: 100),
                  Column(
                    children: <Widget>[
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.greenAccent),
                          child: Text('宽度晨满'),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Image.network("http://www.devio.org/img/avatar.png",
                          width: 100, height: 100),
                      Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                              "http://www.devio.org/img/avatar.png",
                              width: 36,
                              height: 36))
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: <Widget>[
                      _chip('flutter'),
                      _chip('flutter'),
                      _chip('flutter'),
                      _chip('flutter'),
                      _chip('flutter')
                    ],
                  )
                ],
              ),
            )));
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
