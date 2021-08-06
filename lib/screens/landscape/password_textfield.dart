import 'package:ahamsvastha/screens/landscape/textfield_container.dart';
import 'package:ahamsvastha/utils/show_toast.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PasswordTextField({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

bool obscureText = true;

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    Color kPrimaryColor = Color(0xFFfafbff);
    return TextFieldContainer(
      child: Container(
        padding: EdgeInsets.only(
          left: getProportionateWindowWidth(16),
          right: getProportionateWindowWidth(16),
        ),
        child: Center(
          child: TextField(
            obscureText: obscureText,
            onSubmitted: (String value) {
              if (value == null || value == "") {
                var fToast = FToast();
                fToast.init(context);
                showToast(fToast, "Please enter a password!",
                    Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
              } else {
                widget.onChanged(value);
              }
            },
            onChanged: (String value) {
              if (value == null || value == "") {
                var fToast = FToast();
                fToast.init(context);
                showToast(fToast, "Please enter a password!",
                    Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
              } else {
                widget.onChanged(value);
              }
            },
            style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: getProportionateWindowHeight(28),
                fontWeight: FontWeight.w600,
                color: Color(0xFF93a4ee)),
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Password",
              icon: Icon(
                Icons.lock,
                color: Color(0xFFb1bffb),
                size: getProportionateWindowHeight(30),
              ),
              hintStyle: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: getProportionateWindowHeight(28),
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFccd5fb)),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: Color(0xFF93a4ee),
                  size: getProportionateWindowHeight(30),
                ),
                onPressed: () {
                  setState(() {
                    obscureText == true
                        ? obscureText = false
                        : obscureText = true;
                  });
                },
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
