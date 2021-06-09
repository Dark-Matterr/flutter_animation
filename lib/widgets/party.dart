import 'package:flutter/material.dart';
import 'package:flutter_animations/size_config.dart';

class PartyAnimation extends StatefulWidget {
  const PartyAnimation({Key key}) : super(key: key);

  @override
  _PartyAnimationState createState() => _PartyAnimationState();
}

class _PartyAnimationState extends State<PartyAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 2, milliseconds: 500));
    _animation = Tween<Offset>(begin: Offset(0, -0.2), end: Offset(0, 0.4))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      SlideTransition(
        position: _animation,
        child: Center(
          child: Image(
            image: AssetImage("assets/images/confetti.png"),
            height: SizeConfig.defaultSize * 9,
            width: SizeConfig.defaultSize * 20,
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
      Positioned(
        child: Center(
          child: Image(
            image: AssetImage("assets/images/dancing.png"),
            height: SizeConfig.defaultSize * 12,
          ),
        ),
      ),
    ]);
  }
}
