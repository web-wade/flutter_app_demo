import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimationPage extends StatelessWidget {
  final String photo;
  final VoidCallback onTab;
  final double width;

  const HeroAnimationPage({Key key, this.photo, this.onTab, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTab,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Hero animation"),
      ),
      body: Center(
        child: HeroAnimationPage(
          photo: "http://www.devio.org/img/avatar.png",
          width: 300.0,
          onTab: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Flippers Page"),
                ),
                body: Container(
                  color: Colors.lightBlue,
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: HeroAnimationPage(
                    photo: "http://www.devio.org/img/avatar.png",
                    width: 100.0,
                    onTab: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}
