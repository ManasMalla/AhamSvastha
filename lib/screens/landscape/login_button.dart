import 'package:ahamsvastha/screens/landscape/user_profile_activity.dart';
import 'package:ahamsvastha/utils/show_toast.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef ReturnFunction<String> = List<String> Function();

class LoginButton extends StatelessWidget {
  String username = "";
  String password = "";
  ReturnFunction getCredentials;
  LoginButton({
    Key? key,
    required this.username,
    required this.password,
    required this.getCredentials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 370,
      child: SizedBox(
        height: double.infinity,
        child: TextButton(
          onPressed: () {
            var credentials = getCredentials();
            username = credentials[0];
            password = credentials[1];
            if (username == "" && password != "") {
              var fToast = FToast();
              fToast.init(context);
              showToast(fToast, "Please enter a username!",
                  Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
            } else if (password == "" && username != "") {
              var fToast = FToast();
              fToast.init(context);
              showToast(fToast, "Please enter a Password!",
                  Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
            } else if (username == "" || password == "") {
              var fToast = FToast();
              fToast.init(context);
              showToast(fToast, "Please enter a username and password!",
                  Icons.sentiment_very_dissatisfied_rounded, Colors.red, 0.9);
            } else {
              var fToast = FToast();
              fToast.init(context);
              showToast(fToast, "Hurray!", Icons.sentiment_satisfied_rounded,
                  Colors.greenAccent, 0.9);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileActivity(
                    name: username,
                  ),
                ),
              );
            }
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: Color(0xFFfcf8ec),
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
              fontSize: getProportionateWindowHeight(24),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(0xFFe7d5c4),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(getProportionateScreenHeight(56)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
