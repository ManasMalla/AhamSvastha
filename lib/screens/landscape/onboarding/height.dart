import 'package:ahamsvastha/screens/landscape/onboarding/onboarding_screen.dart';
import 'package:ahamsvastha/utils/aham_svastha_user.dart';
import 'package:ahamsvastha/utils/custom_data_input_field.dart';
import 'package:flutter/material.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({Key? key}) : super(key: key);

  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 420,
          height: 300,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 36, left: 24),
                child: Image(
                  image: AssetImage("assets/images/ic_aarogya_height.png"),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 300,
                  width: 270,
                  child: CustomDataInputField(
                      unit: "cms",
                      units: [
                        "cms",
                        "in",
                        "foot",
                      ],
                      initialValue: user.height != null
                          ? (user.height.toString()).contains(".0")
                              ? (user.height ?? 0).toInt().toString()
                              : user.height.toString()
                          : "",
                      initialUnit: user.heightUnit ?? Unit.CMS,
                      onSubmitted: (double height, Unit unit) {
                        user.setHeight(height, unit);
                        print("Height - $height ${unit.value}");
                        changeToNextPage();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
