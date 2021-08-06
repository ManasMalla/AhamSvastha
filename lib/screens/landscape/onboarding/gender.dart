import 'package:ahamsvastha/screens/landscape/onboarding/onboarding_screen.dart';
import 'package:ahamsvastha/utils/image_button.dart';
import 'package:ahamsvastha/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isBoySelected = false;
bool isGirlSelected = false;

enum Gender { BOY, GIRL }

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.only(left: 32, right: 16),
                child: AspectRatio(
                  aspectRatio: 0.947,
                  child: ImageButton(
                    checkPosition: Alignment.bottomLeft,
                    onPressed: () {
                      setState(() {
                        //Enable if want to include disbale selection
                        // isGirlSelected = isGirlSelected ? false : true;
                        isGirlSelected = true;
                        if (isGirlSelected) {
                          isBoySelected = false;

                          user.setGender(Gender.GIRL);
                          changeToNextPage();
                        }
                      });
                    },
                    shouldBeChecked: isGirlSelected,
                    child: Image(
                      image: AssetImage("assets/images/girl_gender.png"),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Spacer(),
              Container(
                margin: EdgeInsets.only(left: 32, right: 16),
                child: AspectRatio(
                  aspectRatio: 1.1,
                  child: ImageButton(
                    onPressed: () {
                      setState(() {
                        //Enable if want to include disbale selection
                        //isBoySelected = isBoySelected ? false : true;
                        isBoySelected = true;
                        if (isBoySelected) {
                          user.setGender(Gender.BOY);
                          isGirlSelected = false;
                          changeToNextPage();
                        }
                      });
                    },
                    shouldBeChecked: isBoySelected,
                    child: Image(
                      image: AssetImage("assets/images/gender_boy.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
