import 'package:ahamsvastha/screens/landscape/input_text_field.dart';
import 'package:ahamsvastha/screens/landscape/login_button.dart';
import 'package:ahamsvastha/screens/landscape/login_screen/rounded_social_card.dart';
import 'package:ahamsvastha/screens/landscape/password_textfield.dart';
import 'package:ahamsvastha/utils/size_config_landscape.dart';
import 'package:flutter/material.dart';

String username = "";
String password = "";
void updateUsername(String value) {
  username = value;
}

void updatePassword(String value) {
  password = value;
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(1513),
      width: getProportionateScreenWidth(1273),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_card.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(125),
          right: getProportionateScreenWidth(110),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(),
              flex: 6,
            ),
            Expanded(
              child: Container(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateWindowWidth(32),
                    color: Color(0xFF645ba7),
                  ),
                ),
              ),
              flex: 6,
            ),
            Expanded(
              child: Container(),
              flex: 2,
            ),
            Expanded(
              child: Container(
                child: InputTextField(
                  hintText: "Username",
                  field_name: "username",
                  icon: Icons.person_outline_rounded,
                  onChanged: (String username) {
                    updateUsername(username);
                    print("Username - $username");
                  },
                ),
              ),
              flex: 9,
            ),
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Expanded(
              child: Container(
                child: PasswordTextField(
                  onChanged: (String password) {
                    updatePassword(password);
                    print("Password - $password");
                  },
                ),
              ),
              flex: 9,
            ),
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 650,
                    child: Container(),
                  ),
                  LoginButton(
                    username: username,
                    password: password,
                    getCredentials: () {
                      print("Username - $username and Password - $password");
                      return [username, password];
                    },
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(),
            ),
            Expanded(
              flex: 24,
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: RoundedSocialCard(
                                provider: "Google",
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 5,
                              child: RoundedSocialCard(
                                provider: "Apple",
                              ),
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Spacer(
                              flex: 3,
                            ),
                            Expanded(
                              flex: 6,
                              child: RoundedSocialCard(
                                provider: "Microsoft",
                              ),
                            ),
                            Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: RoundedSocialCard(
                                provider: "Facebook",
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 5,
                              child: RoundedSocialCard(
                                provider: "Twitter",
                              ),
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
