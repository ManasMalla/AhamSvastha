import 'package:flutter/material.dart';

class OnBoardingPageIndicator extends StatefulWidget {
  int? number = 0;
  final Function(int)? changePageView;
  OnBoardingPageIndicator({Key? key, required this.number, this.changePageView})
      : super(key: key);

  @override
  _OnBoardingPageIndicatorState createState() =>
      _OnBoardingPageIndicatorState();
}

int index = 0;
late Function(int)? changePagerView;

class _OnBoardingPageIndicatorState extends State<OnBoardingPageIndicator> {
  @override
  Widget build(BuildContext context) {
    index = widget.number ?? 0;
    changePagerView = widget.changePageView;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: IconIndicator("gender_page_indicator", 0),
          flex: 3,
        ),
        Spacer(flex: 1),
        Flexible(
          child: IconIndicator("age_page_indicator", 1),
          flex: 3,
        ),
        Spacer(flex: 1),
        Flexible(
          child: IconIndicator("height_page_indicator", 2),
          flex: 3,
        ),
        Spacer(flex: 1),
        Flexible(
          child: IconIndicator("weight_page_indicator", 3),
          flex: 3,
        ),
        Spacer(flex: 1),
        Flexible(
          child: IconIndicator("health_page_indicator", 4),
          flex: 3,
        ),
        Spacer(flex: 1),
        Flexible(
          child: IconIndicator("activity_page_indicator", 5),
          flex: 3,
        ),
      ],
    );
  }
}

Widget IconIndicator(String name, int number) {
  return Opacity(
    opacity: getOpacityArray(number),
    child: AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: InkWell(
          onTap: () {
            changePagerView!(number);
          },
          child: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image(
                  image: AssetImage("assets/images/$name.png"),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

double getOpacityArray(int indicatorPosition) {
  print(" $index $indicatorPosition");
  return indicatorPosition <= index ? 1 : 0.5;
}
