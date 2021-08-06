import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';

class ReviewUserInfoScreen extends StatelessWidget {
  const ReviewUserInfoScreen({Key? key}) : super(key: key);

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
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
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
            Row(
              children: [
                Spacer(
                  flex: 5,
                ),
                Flexible(
                  flex: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getProportionateWindowHeight(20),
                      ),
                      Text(
                        "Review",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Color(0xFF504d90),
                          fontWeight: FontWeight.w800,
                          fontSize: getProportionateWindowHeight(36),
                        ),
                      ),
                      Flexible(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 16),
                                            color: Colors.yellow[700],
                                          ),
                                          flex: 3,
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 24, horizontal: 16),
                                            color: Colors.blueAccent,
                                          ),
                                          flex: 4,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 5,
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Expanded(
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
                  flex: 1,
                ),
                Expanded(
                  child: Container(),
                  flex: 2,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 11,
                      ),
                      Flexible(
                        child: Image(
                          image: AssetImage("assets/images/doctor_manas.png"),
                        ),
                        flex: 40,
                      ),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
