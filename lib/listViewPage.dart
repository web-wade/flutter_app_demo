import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CITY_NAMES = [
  '北京',
  '上海',
  '深圳',
  '广州',
  '大连',
  '北京',
  '上海',
  '深圳',
  '广州',
  '大连',
  '北京',
  '上海',
  '深圳',
  '广州',
  '大连'
];

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('futureBuilder使用技巧'),
        ),
        body: ListView(
          // scrollDirection: Axis.horizontal,
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.black38, fontSize: 20),
      ),
    );
  }
}
