import 'package:flutter/material.dart';
import 'package:flutter_animations/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const SigninButton(
      {@required this.icon, @required this.title, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize * 2,
        vertical: SizeConfig.defaultSize * 1,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(this.color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FaIcon(this.icon),
              Text(
                "${this.title}",
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize * 1.7,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: SizeConfig.defaultSize * 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
