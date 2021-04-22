import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:foodiefox/backend/actors/Customer.dart';
import 'package:foodiefox/ui/components/constants.dart';
import 'package:foodiefox/ui/components/rounded_phone_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key key,
      @required this.isLogin,
      @required this.animationDuration,
      @required this.size,
      @required this.defaultLoginSize,
      @required this.cellNoController})
      : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final TextEditingController cellNoController;

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
                  hint: 'Mobile Number',
                  cellNoController: cellNoController,
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    if (cellNoController.text.isNotEmpty) {
                      Customer customer = new Customer();
                      customer.setCellNo(cellNoController.text);
                      customer = await customer.customerDB
                          .getCustomer(customer.getCellNo());
                      cellNoController.clear();
                      FocusScope.of(context).unfocus();
                    }
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      child: Text('Continue',
                          style: TextStyle(color: Colors.white, fontSize: 18))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
