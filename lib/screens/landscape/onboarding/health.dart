import 'package:ahamsvastha/screens/landscape/onboarding/activity.dart';
import 'package:ahamsvastha/utils/image_button.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: ImageButton(
                      child: ActivityCard(
                          title: "Diabetes",
                          description: "Diabetes",
                          image: "ic_aarogya_hectic"),
                      onPressed: () {}),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: ImageButton(
                      child: ActivityCard(
                          title: "Diabetes",
                          description: "Diabetes",
                          image: "ic_aarogya_hectic"),
                      onPressed: () {}),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: ImageButton(
                      child: ActivityCard(
                          title: "Diabetes",
                          description: "Diabetes",
                          image: "ic_aarogya_hectic"),
                      onPressed: () {}),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: ImageButton(
                      child: ActivityCard(
                          title: "Diabetes",
                          description: "Diabetes",
                          image: "ic_aarogya_hectic"),
                      onPressed: () {}),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: ImageButton(
                      child: ActivityCard(
                          title: "dis",
                          description: "Dis",
                          image: "ic_aarogya_hectic"),
                      onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Flexible(
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: ImageButton(
                      child: ActivityCard(
                          title: "Diabetes",
                          description: "Diabetes",
                          image: "ic_aarogya_hectic"),
                      onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
