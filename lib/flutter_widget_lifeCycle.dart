import 'package:flutter/material.dart';

class WidgetLifecycle extends StatefulWidget {
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class Student extends Person {
  String _school;
  String city;
  String country;
  String name;

  Student(this._school, String name, int age,
      {this.city, this.country = "china"})
      : name = '$country.$city',
        super(name, age) {
    print("我也不知道能干啥");
  }

  @override
  String toString() {
    return 'name:$name,age:$age,city:$city,country:$country';
  }

  String get country1 => country;
}

class Person {
  String name;
  int age;
  Person(this.name, this.age);
  @override
  String toString() {
    return 'name:$name,age:$age';
  }
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;
  @override
  void initState() {
    print('-----initState-------');
    var student = Student("交通", 'wade', 19, city: '大连');
    print(student.toString());
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
