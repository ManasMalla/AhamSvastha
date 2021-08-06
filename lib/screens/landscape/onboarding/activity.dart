import 'package:ahamsvastha/screens/landscape/onboarding/review_user_info.dart';
import 'package:ahamsvastha/utils/image_button.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 0.8,
            child: ImageButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewUserInfoScreen(),
                  ),
                );
              },
              child: ActivityCard(
                title: "Sedentary",
                description: "You spend most of the day sitting!",
                image: "ic_aarogya_sedentary",
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 0.8,
            child: ImageButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewUserInfoScreen(),
                  ),
                );
              },
              child: ActivityCard(
                title: "Active",
                description: "You are on your feet most of the day!",
                image: "ic_aarogya_active",
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 0.8,
            child: ImageButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewUserInfoScreen(),
                  ),
                );
              },
              child: ActivityCard(
                title: "Hectic",
                description: "You are extremely active most of the day!",
                image: "ic_aarogya_hectic",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const ActivityCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              child: AspectRatio(
                aspectRatio: 1.1,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 16, left: 12, right: 12),
                  child: Image(
                    image: AssetImage("assets/images/$image.png"),
                  ),
                ),
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Container(
            color: Color(0xFF4d4990),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style:
                      TextStyle(fontFamily: "Quicksand", color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
