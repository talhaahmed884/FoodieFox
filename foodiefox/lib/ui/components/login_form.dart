import 'package:flutter/material.dart';
import 'package:foodiefox/backend/actors/Customer.dart';
import 'constants.dart';
import 'loading.dart';
import 'rounded_phone_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verify_phone.dart';

class LoginForm extends StatefulWidget {
  LoginForm(
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
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String phoneNumber = "";

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : AnimatedOpacity(
            opacity: widget.isLogin ? 1.0 : 0.0,
            duration: widget.animationDuration * 4,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: widget.size.width,
                  height: widget.defaultLoginSize,
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
                        hint: 'Mobile Number',
                        cellNoController: widget.cellNoController,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () async {
                          if (widget.cellNoController.text.isNotEmpty) {
                            Customer customer = new Customer();
                            customer.setCellNo(widget.cellNoController.text);
                            // customer = await customer.customerDB
                            //     .getCustomer(customer.getCellNo());
                            // loading = true;

                            FocusScope.of(context).unfocus();

                            phoneNumber = widget.cellNoController.text;

                            await _auth.verifyPhoneNumber(
                              phoneNumber: phoneNumber,
                              timeout: Duration(seconds: 60),
                              verificationCompleted:
                                  (AuthCredential credential) async {},
                              verificationFailed:
                                  (FirebaseAuthException exception) async {
                                print(exception);
                              },
                              codeSent: (verificationId, resendingToken) async {
                                this.verificationId = verificationId;
                                // setState(() {
                                //   loading = false;
                                // });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerifyPhone(
                                            phoneNumber: phoneNumber,
                                            verificationId: this.verificationId,
                                          )),
                                );
                              },
                              codeAutoRetrievalTimeout:
                                  (verificationId) async {},
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                            width: widget.size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kPrimaryColor,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.center,
                            child: Text('Continue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
