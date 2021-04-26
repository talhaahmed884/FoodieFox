import 'package:flutter/material.dart';
import 'package:foodiefox/UI/components/cancel_button.dart';
import 'package:foodiefox/UI/components/login_form.dart';
import 'package:foodiefox/UI/components/register_form.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:foodiefox/UI/components/constants.dart';

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

  // text field controller to get the information from the stateless text fields
  // gets information from the Cell No text field
  TextEditingController cellNoController = TextEditingController();
  // gets information from the name text field
  TextEditingController nameController = TextEditingController();
  // gets information from the email text field
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([]);

    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (!visible) {
        // SystemChrome.setEnabledSystemUIOverlays([]);
        FocusScope.of(context).unfocus();
      }
    });

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    cellNoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not)
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // SystemChrome.setEnabledSystemUIOverlays([]);
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
                defaultLoginSize: defaultLoginSize,
                cellNoController: cellNoController),

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
                defaultLoginSize: defaultLoginSize,
                nameController: nameController,
                emailController: emailController,
                cellNoController: cellNoController),
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
