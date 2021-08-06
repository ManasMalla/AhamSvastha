import 'package:ahamsvastha/screens/landscape/onboarding/activity.dart';
import 'package:ahamsvastha/screens/landscape/onboarding/age.dart';
import 'package:ahamsvastha/screens/landscape/onboarding/gender.dart';
import 'package:ahamsvastha/screens/landscape/onboarding/health.dart';
import 'package:ahamsvastha/screens/landscape/onboarding/height.dart';
import 'package:ahamsvastha/screens/landscape/onboarding/onboarding_page_indicator.dart';
import 'package:ahamsvastha/screens/landscape/onboarding/weight.dart';
import 'package:ahamsvastha/utils/aham_svastha_user.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';

int currentPageIndex = 0;
String descriptionText = "";
final PageController controller = PageController(initialPage: 0);
AhamSvasthaUser user = AhamSvasthaUser();

void changeToNextPage() {
  controller.nextPage(
      duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/about_me_background.png"),
              fit: BoxFit.cover),
        ),
        child: Row(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.chevron_left_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 10,
                    ),
                    Flexible(
                      child: Image(
                        image: AssetImage("assets/images/doctor_aarogya.png"),
                      ),
                      flex: 40,
                    ),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateWindowHeight(20),
                  ),
                  Text(
                    "About You",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      color: Color(0xFF504d90),
                      fontWeight: FontWeight.w800,
                      fontSize: getProportionateWindowHeight(36),
                    ),
                  ),
                  Text(
                    descriptionText,
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      color: Color(0xFF353272),
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateWindowWidth(14),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 36),
                      height: getProportionateWindowHeight(90),
                      child: OnBoardingPageIndicator(
                        number: currentPageIndex,
                        changePageView: manuallyScrollPageView,
                      ),
                    ),
                  ),
                  Flexible(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PageView(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (int indexOfNewPage) {
                              setState(() {
                                currentPageIndex = indexOfNewPage;
                                descriptionText =
                                    getTextHeadline(currentPageIndex);
                              });
                            },
                            children: [
                              GenderScreen(),
                              AgeScreen(),
                              HeightScreen(),
                              WeightScreen(),
                              HealthScreen(),
                              ActivityScreen(),
                            ],
                          ))),
                ],
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

manuallyScrollPageView(int number) {
  controller.animateToPage(number,
      duration: Duration(milliseconds: 400), curve: Curves.ease);
}

String getTextHeadline(int number) {
  String headline = "";
  switch (number) {
    case 0:
      headline = "Please select your gender!";
      break;
    case 1:
      headline = "Please enter your date of birth!";
      break;
    case 2:
      headline = "Please enter your height!";
      break;
    case 3:
      headline = "Please enter your weight!";
      break;
    case 4:
      headline = "Please select all the diseases you have!";
      break;
    case 5:
      headline = "Please select how your day goes on!";
      break;
  }
  return headline;
}
