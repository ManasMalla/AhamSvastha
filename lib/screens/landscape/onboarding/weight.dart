import 'package:ahamsvastha/screens/landscape/onboarding/onboarding_screen.dart';
import 'package:ahamsvastha/utils/aham_svastha_user.dart';
import 'package:ahamsvastha/utils/custom_data_input_field.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
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
                margin: EdgeInsets.only(bottom: 18, left: 36),
                child: Image(
                  image: AssetImage("assets/images/ic_aarogya_weight.png"),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 300,
                  width: 270,
                  child: CustomDataInputField(
                      unit: "kgs",
                      units: ["kgs", "lbs"],
                      initialValue: user.weight != null
                          ? (user.weight.toString()).contains(".0")
                              ? (user.weight ?? 0).toInt().toString()
                              : user.weight.toString()
                          : "",
                      initialUnit: user.weightUnit ?? Unit.KGS,
                      onSubmitted: (double weight, Unit unit) {
                        print("Weight - $weight kgs");
                        user.setWeight(weight, unit);
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
