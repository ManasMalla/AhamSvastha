import 'dart:io';
import 'package:ahamsvastha/screens/landscape/input_text_field.dart';
import 'package:ahamsvastha/screens/landscape/onboarding/onboarding_screen.dart';
import 'package:ahamsvastha/utils/show_toast.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isImageFromFile = false;
XFile? imageFile;
bool isEditingDetails = false;
bool isImageSelected = false;

class UserProfileActivity extends StatefulWidget {
  String name;
  String email = "Please enter your email!";
  UserProfileActivity({Key? key, required String this.name}) : super(key: key);

  @override
  _UserProfileActivityState createState() => _UserProfileActivityState();
}

class _UserProfileActivityState extends State<UserProfileActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.bottomRight,
          child: Material(
            child: Container(
              width: getProportionateScreenWidth(140),
              height: getProportionateScreenWidth(140),
              child: InkWell(
                onTap: () {
                  if (widget.email == "Please enter your email!" ||
                      widget.email == "") {
                    //Need some email
                    var fToast = FToast();
                    fToast.init(context);
                    showToast(fToast, "Please enter your email id!",
                        Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
                  } else if (widget.name == "") {
                    //Need some name
                    var fToast = FToast();
                    fToast.init(context);
                    showToast(fToast, "Please enter your name!",
                        Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
                  } else if (!isImageSelected) {
                    var fToast = FToast();
                    fToast.init(context);
                    showToast(fToast, "Please upload a profile picture!",
                        Icons.sentiment_dissatisfied_rounded, Colors.red, 0.9);
                  } else {
                    var fToast = FToast();
                    fToast.init(context);
                    showToast(
                        fToast,
                        "Hurray!",
                        Icons.sentiment_satisfied_rounded,
                        Colors.greenAccent,
                        0.9);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnBoardingScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/bottom_clip_next_button.svg",
                        fit: BoxFit.fill,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 8),
                        child: Image(
                          image: AssetImage("assets/images/arrow_right.png"),
                          height: 54,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Image(
                        image: AssetImage("assets/images/about_you.png"),
                      ),
                    ),
                  ),
                ],
              ),
              flex: 4,
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24, top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "About You",
                      style: TextStyle(
                        fontFamily: "Quicksand",
                        color: Color(0xFF504d90),
                        fontWeight: FontWeight.w800,
                        fontSize: getProportionateWindowHeight(36),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateWindowHeight(16),
                    ),
                    Text(
                      "The information you provide will help us know you better and tailor the app experience just for you!",
                      style: TextStyle(
                        fontFamily: "Quicksand",
                        color: Color(0xFFbfbfbf),
                        fontWeight: FontWeight.w600,
                        fontSize: getProportionateWindowWidth(14),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    ClipOval(
                      child: Material(
                        child: Container(
                          width: getProportionateWindowHeight(175),
                          height: getProportionateWindowHeight(175),
                          child: InkWell(
                            onTap: () async {
                              if (Platform.isMacOS) {
                                final typeGroup =
                                    XTypeGroup(label: 'images', extensions: [
                                  'jpg',
                                  'png',
                                  'jpeg',
                                  'tif',
                                  'tiff',
                                  'bmp',
                                  'gif',
                                ]);
                                final file = await FileSelectorPlatform.instance
                                    .openFile(acceptedTypeGroups: [typeGroup]);
                                setState(() {
                                  if (file != null) {
                                    isImageFromFile = true;
                                    imageFile = file;
                                    isImageSelected = true;
                                  }
                                });
                              }
                            },
                            child: isImageFromFile == false
                                ? Image(
                                    image: AssetImage(
                                        "assets/images/add_profile_pic.png"),
                                  )
                                : Image.file(File(imageFile!.path)),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isEditingDetails == false
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${widget.name}",
                                    style: TextStyle(
                                      fontFamily: "Quicksand",
                                      color: Color(0xFF645ba7),
                                      fontWeight: FontWeight.w800,
                                      fontSize: getProportionateWindowWidth(28),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${widget.email}",
                                    style: TextStyle(
                                      fontFamily: "Quicksand",
                                      color: Color(0xFF504d90),
                                      fontWeight: FontWeight.w700,
                                      fontSize: getProportionateWindowWidth(20),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : Flexible(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    getProportionateScreenWidth(16),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            getProportionateWindowHeight(60),
                                        child: InputTextField(
                                            hintText: "Name",
                                            field_name: "name",
                                            defaultText: "${widget.name}",
                                            icon: Icons
                                                .sentiment_satisfied_alt_rounded,
                                            onChanged: (String name) {
                                              widget.name = name;
                                            }),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height:
                                            getProportionateWindowHeight(60),
                                        child: InputTextField(
                                            hintText: "Email-Id",
                                            field_name: "email-id",
                                            hintTextSize: 24,
                                            defaultText: "${widget.email}",
                                            icon: Icons.alternate_email_rounded,
                                            onChanged: (String email) {
                                              widget.email = email;
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        Container(
                          margin:
                              EdgeInsets.all(getProportionateScreenHeight(16)),
                          height: getProportionateWindowHeight(36),
                          width: getProportionateWindowHeight(36),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isEditingDetails = !isEditingDetails;
                              });
                            },
                            icon: Icon(
                              isEditingDetails == true
                                  ? Icons.check_rounded
                                  : Icons.edit_rounded,
                              color: Colors.grey,
                            ),
                            iconSize: 36,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
