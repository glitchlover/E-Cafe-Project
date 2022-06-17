import 'dart:async';
import 'package:flutter/material.dart';
import 'package:versity_project_coffee/backend_api/registrationhandling.dart';
import 'package:versity_project_coffee/bottom_page.dart';
import '../../database/userBoxController.dart';
import '../pallete.dart';
import 'package:get/get.dart';
import 'package:versity_project_coffee/features/homePage/presentation/pages/sellerPage.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    Key? key,
    required this.buttonName,
    required this.user,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.userType,
  }) : super(key: key);

  final String buttonName;
  final String user;
  final String email;
  final String password;
  final String confirmPassword;
  final String userType;
  late String messages = ' ';

  Future<bool> registrationInAPI() async {
    try {
      var token = await RegistrationHelper().registrating(
        userName: user,
        password: password,
        userTypes: userType,
        email: email,
      );
      print("token: " + token);
      UserBoxController().addToken(token);
      UserBoxController().addUserName(user);
      UserBoxController().addRole(userType);

      return false;//it was true
    } catch (e) {
      print(e.toString());
      messages = "Error";
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: kBrown,
        borderRadius: BorderRadius.circular(16),
        elevation: 5,
        child: MaterialButton(
          minWidth: size.width * 0.6,
          height: size.height * 0.07,
          onPressed: () async {
            if (password == confirmPassword && password.isNotEmpty) {
              var status = await registrationInAPI();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    if (status == false) {
                      Navigator.pop(context);
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  });
              
              if (status == true) {
                if (userType == 'buyer') {
                  Get.offAll(() => BottomPage());
                } else if (userType == 'seller') {
                  Get.offAll(() => HomePage());
                }
              } else {
                print("Message: " + messages);
              }
            } else {
              print('Your password doesn\'t matched');
            }
            // Navigator.pop(context);
          },
          child: Text(
            buttonName,
            style: kBodyText.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
