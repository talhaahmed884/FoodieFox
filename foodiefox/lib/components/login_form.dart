import 'package:flutter/material.dart';
import 'package:foodiefox/components/rounded_button.dart';
import 'package:foodiefox/components/rounded_phone_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
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
    );
  }
}
