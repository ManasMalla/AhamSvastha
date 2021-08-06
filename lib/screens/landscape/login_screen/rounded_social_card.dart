import 'package:ahamsvastha/utils/show_toast.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RoundedSocialCard extends StatelessWidget {
  final String provider;
  const RoundedSocialCard({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Container(
        decoration: provider == "Facebook"
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0266df),
                    Color(0xFF18acff),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(
                  getProportionateScreenHeight(42),
                ),
              )
            : BoxDecoration(),
        child: ElevatedButton(
          onPressed: () {
            if (provider == "Apple") {
              FToast fToast = FToast();
              fToast.init(context);
              showToast(
                  fToast,
                  "Oops, Sorry! Currently Unavailable!",
                  Icons.sentiment_dissatisfied_rounded,
                  Colors.grey[800]!,
                  0.75);
            }
          },
          style: ElevatedButton.styleFrom(
            shadowColor: provider == "Facebook"
                ? Colors.transparent
                : Theme.of(context).shadowColor,
            elevation: 2,
            padding: EdgeInsets.all(2),
            primary: provider == "Apple"
                ? Colors.black
                : provider == "Facebook"
                    ? Colors.transparent
                    : provider == "Twitter"
                        ? Color(0xFF1da1f2)
                        : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                getProportionateScreenHeight(42),
              ),
            ),
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  provider == "Google"
                      ? "assets/images/google_logo.svg"
                      : provider == "Apple"
                          ? "assets/images/apple_logo.svg"
                          : provider == "Facebook"
                              ? "assets/images/facebook_logo.svg"
                              : provider == "Microsoft"
                                  ? "assets/images/microsoft_logo.svg"
                                  : provider == "Twitter"
                                      ? "assets/images/twitter_logo.svg"
                                      : "assets/images/google_logo.svg",
                  height: getProportionateWindowWidth(24),
                ),
                Text(
                  "Sign in with $provider",
                  style: TextStyle(
                    color: provider == "Apple" ||
                            provider == "Facebook" ||
                            provider == "Twitter"
                        ? Colors.white
                        : Colors.black,
                    fontFamily: "Quicksand",
                    fontSize: getProportionateWindowWidth(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
