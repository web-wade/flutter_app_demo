import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatelessWidget与基础组件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _launchURL(),
              child: Text("打开浏览器"),
            ),
            RaisedButton(
              onPressed: () => _openMap(),
              child: Text("打开地图a"),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openMap() async {
    const url = 'geo:52.32,4.917';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      await launch(url);
    }
  }
}
