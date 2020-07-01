import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    return Container(child: Text('常用数据类型'),);
  }

  void _numType() {
    num num1 = -1.0;
    num num2 = 2;
    int int1 = 3;
    double int2 = 2.00;
    print("num:$num1");
    print(num1.abs());
  }
}
