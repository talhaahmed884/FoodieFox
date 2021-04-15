//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiefox/components/rounded_button.dart';
import 'package:foodiefox/components/rounded_input.dart';
import 'package:foodiefox/components/rounded_password__input.dart';
import 'package:foodiefox/components/rounded_phone_input.dart';
import '../../constants.dart';
import 'image_banner.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  Animation<double> containerSize;
  AnimationController animationController;
  Duration animationDuration = Duration(microseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not)
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaaultRegisterSize = size.height - (size.height * 0.1);
    //------------------------------------------
    double w = MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).padding;
    double screen_width = w - padding.left - padding.right;
    //-----------------------------------------

    containerSize = Tween<double>(
        begin: size.height * 0.1, end: defaaultRegisterSize)
        .animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Cancel Button
            Visibility(
              visible: !isLogin,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: size.width,
                  height: size.height * 0.1,
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      animationController.reverse();
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            //LOGIN FORM
            AnimatedOpacity(
              opacity: isLogin ? 1.0 : 0.0,
              duration: animationDuration * 4,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Foodie Fox',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        SizedBox(height: 40),
                        //ImageBanner('assets/images/Orix_LoginPlaceholder.png'),
                        //decoration: BoxDecoration(color: Colors.white),
                        Image.asset('assets/images/hangout_yellow_vector.png'),
                        SizedBox(height: 40),

                        RoundedPhoneInput(
                          icon: Icons.mobile_friendly,
                          hint: 'Phone Number',
                        ),
                        SizedBox(height: 10),
                        RoundedButton(title: 'Continue')
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // REGISTER CONTAINER
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                if (viewInset == 0 && isLogin) {
                  return buildRegisterContainer();
                } else if (!isLogin) {
                  return buildRegisterContainer();
                }

                // Return empty container to hide the widget
                return Container();
              },
            ),

            AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration * 5,
              child: Visibility(
                visible: !isLogin,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Container(
                      width: size.width,
                      height: defaultLoginSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to foodie fox',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          SizedBox(height: 20),
                          Image.asset(
                              'assets/images/hangout_yellow_vector.png'),
                          SizedBox(height: 20),
                          RoundedInput(
                            icon: Icons.face_rounded,
                            hint: 'Name',
                          ),
                          RoundedPhoneInput(
                            icon: Icons.mobile_friendly,
                            hint: 'Phone Number',
                          ),
                          RoundedInput(
                            icon: Icons.email,
                            hint: 'Email',
                          ),
                          SizedBox(height: 10),
                          RoundedButton(title: 'Sign up')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: kBackgroundColor),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            animationController.forward();
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: isLogin
              ? Text(
            "Don't have an account? Sign up",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          )
              : null,
        ),
      ),
    );
  }
}
