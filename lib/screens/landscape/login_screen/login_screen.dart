import 'package:ahamsvastha/screens/landscape/login_screen/login_card.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("assets/images/login_screen_background.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(64),
                  left: getProportionateScreenWidth(300),
                  bottom: getProportionateScreenHeight(32)),
              child: Image(
                image: AssetImage("assets/images/aarogya_vrukasana.png"),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: LoginCard(),
            ),
          ],
        ),
      ),
    );
  }
}
