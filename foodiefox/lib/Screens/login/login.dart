import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiefox/components/cancel_button.dart';
import 'package:foodiefox/components/login_form.dart';
import 'package:foodiefox/components/register_form.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../constants.dart';

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

    KeyboardVisibilityBuilder(builder: (context, visible) {
      if (!visible) {
        SystemChrome.setEnabledSystemUIOverlays([]);
      }
    });

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
        FocusScope.of(context).unfocus();
        SystemChrome.setEnabledSystemUIOverlays([]);
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Cancel Button
            CancelButton(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              animationController: animationController,
              tapEvent: isLogin //returning null to disable button
                  ? null
                  : () {
                      animationController.reverse();
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
            ),
            //LOGIN FORM
            LoginForm(
                isLogin: isLogin,
                animationDuration: animationDuration,
                size: size,
                defaultLoginSize: defaultLoginSize),

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

            //Register Form
            RegisterForm(
                isLogin: isLogin,
                animationDuration: animationDuration,
                size: size,
                defaultLoginSize: defaultLoginSize),
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
          onTap: !isLogin
              ? null
              : () {
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
