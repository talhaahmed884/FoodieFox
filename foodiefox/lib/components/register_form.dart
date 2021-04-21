import 'package:flutter/material.dart';
import 'package:foodiefox/components/rounded_button.dart';
import 'package:foodiefox/components/rounded_input.dart';
import 'package:foodiefox/components/rounded_phone_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Image.asset('assets/images/hangout_yellow_vector.png'),
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
    );
  }
}