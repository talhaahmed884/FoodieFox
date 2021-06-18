import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';
import 'package:foodiefox_customer/ui/login/components/rounded_input.dart';

class Profile extends StatefulWidget {
  Profile({Key key, @required this.size, @required this.defaultLoginSize})
      : super(key: key);

  final Size size;
  final double defaultLoginSize;

  @override
  _ProfileState createState() => _ProfileState(size, defaultLoginSize);
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  Size size;
  double defaultLoginSize;
  TextEditingController phoneEditingController = new TextEditingController();
  TextEditingController nameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();

  _ProfileState(Size size, double defaultLoginSize) {
    this.size = size;
    this.defaultLoginSize = defaultLoginSize;
  }

  @override
  void dispose() {
    super.dispose();
    phoneEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                  SizedBox(height: 40),
                  Image.asset("assets/icons/displayPlaceHolder.png"),
                  SizedBox(height: 40),
                  RoundedInput(
                    icon: Icons.mobile_friendly,
                    hint: 'Name',
                    textInputType: TextInputType.phone,
                    textEditingController: nameEditingController,
                  ),
                  SizedBox(height: 40),
                  RoundedInput(
                    icon: Icons.mobile_friendly,
                    hint: 'Phone Number',
                    textInputType: TextInputType.phone,
                    textEditingController: phoneEditingController,
                  ),
                  SizedBox(height: 40),
                  RoundedInput(
                    icon: Icons.mobile_friendly,
                    hint: 'Email',
                    textInputType: TextInputType.phone,
                    textEditingController: emailEditingController,
                  ),
                  SizedBox(height: 10),
                  _roundedButton(context)
                ],
              ),
            ),
          ),
        ));
  }

  Widget _roundedButton(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primary_Yellow,
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text('Continue',
              style: TextStyle(color: Colors.white, fontSize: 18))),
    );
  }
}
