import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(56)),
        color: Color(0xFFeef1fd),
      ),
      child: child,
    );
  }
}
