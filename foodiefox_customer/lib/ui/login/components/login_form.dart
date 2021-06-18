import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiefox_customer/backend/validator/Validator.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';
import 'package:foodiefox_customer/ui/login/components/rounded_input.dart';
import 'package:foodiefox_customer/ui/otp/otp_verification.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key, @required this.size, @required this.defaultLoginSize})
      : super(key: key);

  final Size size;
  final double defaultLoginSize;

  @override
  _LoginFormState createState() => _LoginFormState(size, defaultLoginSize);
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  Size size;
  double defaultLoginSize;
  TextEditingController phoneEditingController = new TextEditingController();

  _LoginFormState(Size size, double defaultLoginSize) {
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
    return Align(
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
              Image.asset('assets/images/hangout_yellow_vector.png'),
              SizedBox(height: 40),
              RoundedInput(
                icon: Icons.mobile_friendly,
                hint: 'Phone Number',
                textInputType: TextInputType.phone,
                textEditingController: phoneEditingController,
              ),
              SizedBox(height: 10),
              _roundedButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundedButton(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        FocusScope.of(context).unfocus();

        if (phoneEditingController.text.isNotEmpty) {
          Validator validator = new Validator();

          if (validator
              .validateCellNo(phoneEditingController.text.toString())) {
            String cellNo = validator
                .transformPhoneNumber(phoneEditingController.text.toString());
            print('--------------------------' + cellNo);
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => OTPVerification(cellNumber: cellNo)));
          } else {
            SnackBar snackBar = SnackBar(
              content: Text('This Phone Number is invalid!!'),
              backgroundColor: primary_Yellow,
              duration: Duration(seconds: 5),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
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
