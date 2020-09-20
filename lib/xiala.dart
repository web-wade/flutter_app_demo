import 'package:flutter/material.dart';

class XialaPage extends StatefulWidget {
  @override
  _XialaPageState createState() => _XialaPageState();
}

class _XialaPageState extends State<XialaPage> {
  List<String> cityName = [
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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    }); // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('futureBuilder使用技巧'),
          ),
          body: RefreshIndicator(
              child: ListView(
                // scrollDirection: Axis.horizontal,
                controller: _scrollController,
                children: _buildList(),
              ),
              onRefresh: _handRefresh)),
    );
  }

  _loadData() async {
    await Future.delayed(Duration(seconds: 2));
    print("11111");
    setState(() {
      List<String> list = List<String>.from(cityName);
      list.addAll(cityName);
      cityName = list;
    });
  }

  Future<Null> _handRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityName = cityName.reversed.toList();
    });
    return null;
  }

  List<Widget> _buildList() {
    return cityName.map((city) => _item(city)).toList();
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
