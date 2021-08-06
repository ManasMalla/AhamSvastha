import 'package:ahamsvastha/screens/landscape/onboarding/onboarding_screen.dart';
import 'package:ahamsvastha/utils/aham_svastha_user.dart';
import 'package:ahamsvastha/utils/custom_data_input_field.dart';
import 'package:ahamsvastha/utils/date_time_picker.dart';
import 'package:flutter/material.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 420,
        height: 200,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              // child: CustomDataInputField(
              //   unit: "years",
              //   onSubmitted: (String age) {
              //     print("Age - $age years");
              //     changeToNextPage();
              //   },
              // ),
              child: DateTimePicker(
                dataRequired: DateTimeData.DATE,
                onSelected: (DateTime birthday) {
                  user.setBirthday(birthday);
                  changeToNextPage();
                },
                initialDate: user.birthday,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
