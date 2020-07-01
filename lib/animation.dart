import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class LogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    );
  }
}

// class AnimationLogo extends AnimatedWidget {
//   AnimationLogo({Key key, Animation<double> animation})
//       : super(key: key, listenable: animation);

//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return Center(
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         height: animation.value,
//         width: animation.value,
//         child: FlutterLogo(),
//       ),
//     );
//   }
// }

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  // AnimationStatus animationStatus;
  // double animationValue;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
    // ..addListener(() {
    //   setState(() {
    //     animationValue = animation.value;
    //   });
    // })
    // ..addStatusListener((AnimationStatus status) {
    //   setState(() {
    //     animationStatus = status;
    //   });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return AnimationLogo(
    //   animation: animation,
    // );
    return GrowTransition(
      animation: animation,
      child: LogWidget(),
    );
  }
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.only(top: 40),
  //     child: Column(
  //       children: <Widget>[
  //         GestureDetector(
  //           child: Text(
  //             'start',
  //             textDirection: TextDirection.ltr,
  //           ),
  //           onTap: () {
  //             controller.reset();
  //             controller.forward();
  //           },
  //         ),
  //         Text(
  //           'state' + animationStatus.toString(),
  //           textDirection: TextDirection.ltr,
  //         ),
  //         Text(
  //           'state' + animationValue.toString(),
  //           textDirection: TextDirection.ltr,
  //         ),
  //         Container(
  //           height: animation.value,
  //           width: animation.value,
  //           child: FlutterLogo(),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
