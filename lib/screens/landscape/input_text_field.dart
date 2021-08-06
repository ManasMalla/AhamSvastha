import 'package:ahamsvastha/screens/landscape/textfield_container.dart';
import 'package:ahamsvastha/utils/show_toast.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  double? hintTextSize = getProportionateWindowHeight(28);
  final ValueChanged<String> onChanged;
  String defaultText = "";
  String? holder;
  final String field_name;
  InputTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.hintTextSize,
    this.defaultText = "",
    required this.field_name,
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  String error = "";

  @override
  Widget build(BuildContext context) {
    Color kPrimaryColor = Color(0xFFfafbff);
    print("Widget - ${widget.defaultText}");
    if (widget.defaultText == "Please enter your email!") {
      widget.defaultText = "";
    }
    return TextFieldContainer(
      child: Container(
        padding: EdgeInsets.only(
            left: getProportionateWindowWidth(16),
            right: getProportionateWindowWidth(16)),
        child: Center(
          child: TextField(
            onSubmitted: (String value) {
              print("Hello $value");
              if (value == null || value == "") {
                var fToast = FToast();
                fToast.init(context);
                showToast(fToast, "Please enter a ${widget.field_name}!",
                    Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
              } else {
                widget.onChanged(value);
              }
            },
            onChanged: (String? value) {
              if (value == null || value == "") {
                var fToast = FToast();
                fToast.init(context);
                showToast(fToast, "Please enter a ${widget.field_name}!",
                    Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
              } else {
                widget.onChanged(value);
              }
            },
            cursorColor: kPrimaryColor,
            controller: widget.defaultText == ""
                ? null
                : TextEditingController(text: widget.defaultText),
            style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: widget.hintTextSize == null
                    ? getProportionateWindowHeight(28)
                    : widget.hintTextSize!,
                fontWeight: FontWeight.w600,
                color: Color(0xFF93a4ee)),
            decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                color: Color(0xFFb1bffb),
                size: widget.hintTextSize == null
                    ? getProportionateWindowHeight(30)
                    : widget.hintTextSize! + getProportionateWindowHeight(2),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: widget.hintTextSize == null
                      ? getProportionateWindowHeight(28)
                      : widget.hintTextSize!,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFccd5fb)),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
