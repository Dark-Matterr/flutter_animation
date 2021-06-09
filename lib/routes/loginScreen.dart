import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/party.dart';
import 'package:flutter_animations/size_config.dart';
import 'package:flutter_animations/widgets/signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1, milliseconds: 500));
    _animation = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _controller.forward();
                },
                child: Container(
                  height: SizeConfig.defaultSize * 45,
                  decoration: const BoxDecoration(
                    image: const DecorationImage(
                        image: const AssetImage("assets/images/bg.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeTransition(
                            opacity: _animation,
                            child: Image(
                              image: AssetImage("assets/images/banner.png"),
                              height: SizeConfig.defaultSize * 7.5,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.defaultSize * 2.5,
                          ),
                          PartyAnimation(),
                          SizedBox(
                            height: SizeConfig.defaultSize * 1,
                          ),
                          FadeTransition(
                            opacity: _animation,
                            child: Text(
                              "Welcome to budget++",
                              style: TextStyle(
                                fontSize: SizeConfig.defaultSize * 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity: _animation,
                            child: Container(
                              width: SizeConfig.defaultSize * 33,
                              child: Wrap(
                                children: [
                                  Text(
                                    "You just took the first step to get your money into shape. Let's get started!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: SizeConfig.defaultSize * 1.3,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: SigninButton(
                  icon: FontAwesomeIcons.google,
                  color: Colors.red,
                  title: "Sign In with Google",
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: SigninButton(
                  icon: FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  title: "Sign In with Facebook",
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: SigninButton(
                  icon: FontAwesomeIcons.envelope,
                  color: Colors.green[400],
                  title: "Sign Up with Email",
                ),
              ),
              FadeTransition(
                opacity: _animation,
                child: SigninButton(
                  icon: FontAwesomeIcons.envelope,
                  color: Colors.green[400],
                  title: "Login with Email",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
