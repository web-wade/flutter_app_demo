import 'package:flutter/material.dart';

class WidgetLifecycle extends StatefulWidget {
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;
  @override
  void initState() {
    print('-----initState-------');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('-----didChangeDependencies-------');
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    print('----build-------');
    return Scaffold(
      appBar: AppBar(
        title: Text('fluter页面生命周期'),
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            child: Text(
              '点我',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Text(_count.toString())
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print("-----didUpdateWidget-----");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("-----deactivate-----");
    super.deactivate();
  }

  @override
  void dispose() {
    print("-----dispose-----");
    super.dispose();
  }
}
