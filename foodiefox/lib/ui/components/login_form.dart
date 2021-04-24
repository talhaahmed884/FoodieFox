import 'package:flutter/material.dart';
import 'package:foodiefox/backend/actors/Customer.dart';
import 'package:foodiefox/ui/components/constants.dart';
import 'package:foodiefox/ui/components/rounded_phone_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodiefox/ui/components/verify_phone.dart';

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

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
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
                  cellNoController: widget.cellNoController,
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    if (widget.cellNoController.text.isNotEmpty) {
                      showLoading = true;
                      Customer customer = new Customer();
                      customer.setCellNo(widget.cellNoController.text);
                      customer = await customer.customerDB
                          .getCustomer(customer.getCellNo());

                      FocusScope.of(context).unfocus();
                      phoneNumber = widget.cellNoController.text;
                      // print(phoneNumber) ;
                      await _auth.verifyPhoneNumber(
                        phoneNumber: phoneNumber,
                        timeout: Duration(seconds: 60),
                        verificationCompleted:
                            (AuthCredential credential) async {
                          // showLoading = false ;
                          // Navigator.of(context).pop();

                          // UserCredential result = await _auth.signInWithCredential(credential);

                          // User user = result.user;

                          // if(user != null){
                          //   print("code automatically fetchedddddd !!!!!!!!!!!!!!!!!!!!!") ;
                          //   Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => HomeScreen(user: user,)
                          //   ));
                          // }else{
                          //   print("Error");
                          // }
                        },
                        verificationFailed:
                            (FirebaseAuthException exception) async {
                          print(exception);
                        },
                        codeSent: (verificationId, resendingToken) async {
                          showLoading = false;
                          this.verificationId = verificationId;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyPhone(
                                      phoneNumber: phoneNumber,
                                      verificationId: this.verificationId,
                                    )),
                          );
                        },
                        codeAutoRetrievalTimeout: (verificationId) async {},
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
