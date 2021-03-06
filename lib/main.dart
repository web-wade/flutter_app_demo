import 'package:flutter/material.dart';
import 'package:flutter_app/shared.dart';
import 'package:flutter_app/xiala.dart';

import 'add_lifecycle.dart';
import 'animation.dart';
import 'fluterLayout.dart';
import 'flutter_widget_lifeCycle.dart';
import 'gesture_page.dart';
import 'hero_animation.dart';
import 'http.dart';
import 'http_async.dart';
import 'launch_Page.dart';
import 'less_group_page.dart';
import 'listViewPage.dart';
import 'photo_app_page.dart';
import 'res_page.dart';
import 'statefull_page.dart';

void main() => runApp(DynamciTheme());

class DynamciTheme extends StatefulWidget {
  @override
  _DynamciThemeState createState() => _DynamciThemeState();
}

class _DynamciThemeState extends State<DynamciTheme> {
  Brightness brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 必备知识',
      theme: ThemeData(
        brightness: brightness,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'full': (BuildContext context) => StateFullPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'image': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'lifecycle': (BuildContext context) => WidgetLifecycle(),
        'app': (BuildContext context) => AppLifecycle(),
        'photo': (BuildContext context) => PhotoAppPage(),
        'animation': (BuildContext context) => AnimationPage(),
        'hero': (BuildContext context) => HeroAnimation(),
        'http': (BuildContext context) => HttpPage(),
        'httpAsync': (BuildContext context) => HttpAsync(),
        'Sharedpage': (BuildContext context) => Sharedpage(),
        'ListViewPage': (BuildContext context) => ListViewPage(),
        'XialaPage': (BuildContext context) => XialaPage(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '创建路由',
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
          _item('FlutterLayoutPage与基础组件', FlutterLayoutPage(), 'layout'),
          _item('StateFullPage与基础组件', StateFullPage(), 'full'),
          _item('GesturePage', GesturePage(), 'gesture'),
          _item('ResPage', ResPage(), 'image'),
          _item('LaunchPage打开第三方应用', LaunchPage(), 'launch'),
          _item('WidgetLifecycle', WidgetLifecycle(), 'lifecycle'),
          _item('AppLifecycle', AppLifecycle(), 'app'),
          _item('PhotoAppPage', PhotoAppPage(), 'photo'),
          _item('AnimationPage', AnimationPage(), 'animation'),
          _item('HeroAnimation', HeroAnimation(), 'hero'),
          _item('HttpPage', HttpPage(), 'http'),
          _item('HttpAsync', HttpAsync(), 'httpAsy nc'),
          _item('Sharedpage', Sharedpage(), 'Sharedpage'),
          _item('ListViewPage', ListViewPage(), 'ListViewPage'),
          _item('XialaPage', XialaPage(), 'XialaPage'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(title),
      ),
    );
  }
}

// class RouterNavigator extends StatefulWidget {
//   @override
//   _RouterNavigatorState createState() => _RouterNavigatorState();
// }

// class _RouterNavigatorState extends State<RouterNavigator> {
//   bool byName = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView(
//         children: <Widget>[
//           SwitchListTile(
//               title: Text('${byName ? "" : "不"}'),
//               value: byName,
//               onChanged: (value) {
//                 setState(() {
//                   byName = value;
//                 });
//               }),
//          _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
//          _item('FlutterLayoutPage与基础组件', FlutterLayoutPage(), 'layout'),
//          _item('StateFullPage与基础组件', StateFullPage(), 'full'),
//          _item('GesturePage', GesturePage(), 'gesture'),
//          _item('ResPage', ResPage(), 'image'),
//           _item('LaunchPage打开第三方应用', LaunchPage(), 'launch'),
//           _item('WidgetLifecycle', WidgetLifecycle(), 'lifecycle'),
//           _item('AppLifecycle', AppLifecycle(), 'app'),
//           _item('PhotoAppPage', PhotoAppPage(), 'photo'),
//           _item('AnimationPage', AnimationPage(), 'animation'),
//           _item('HeroAnimation', HeroAnimation(), 'hero'),
//           _item('HttpPage', HttpPage(), 'http'),
//           _item('HttpAsync', HttpAsync(), 'httpAsy nc'),
//           _item('Sharedpage', Sharedpage(), 'Sharedpage'),
//           _item('ListViewPage', ListViewPage(), 'ListViewPage'),
//           _item('XialaPage', XialaPage(), 'XialaPage'),
//         ],
//       ),
//     );
//   }

//   _item(String title, page, String routeName) {
//     return Container(
//       child: RaisedButton(
//         onPressed: () {
//           if (byName) {
//             Navigator.pushNamed(context, routeName);
//           } else {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => page));
//           }
//         },
//         child: Text(title),
//       ),
//     );
//   }
// }
