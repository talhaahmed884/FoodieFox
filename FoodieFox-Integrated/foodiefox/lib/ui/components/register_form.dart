import 'package:flutter/material.dart';
import 'package:foodiefox/backend/actors/Customer.dart';
import 'constants.dart';
import 'loading.dart';
import 'rounded_input.dart';
import 'rounded_phone_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verify_phone.dart';

// ignore: must_be_immutable
class RegisterForm extends StatelessWidget {
  String phoneNumber = "";

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  String verificationId = "";
  RegisterForm(
      {Key key,
      @required this.isLogin,
      @required this.animationDuration,
      @required this.size,
      @required this.defaultLoginSize,
      @required this.nameController,
      @required this.emailController,
      @required this.cellNoController})
      : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController cellNoController;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : AnimatedOpacity(
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
                        Image.asset('assets/images/hangout_yellow_vector.png'),
                        SizedBox(height: 20),
                        RoundedInput(
                          icon: Icons.face_rounded,
                          hint: 'Name',
                          fieldController: nameController,
                        ),
                        RoundedPhoneInput(
                          icon: Icons.mobile_friendly,
                          hint: 'Phone Number',
                          cellNoController: cellNoController,
                        ),
                        RoundedInput(
                          icon: Icons.email,
                          hint: 'Email',
                          fieldController: emailController,
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () async {
                            if (nameController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                cellNoController.text.isNotEmpty) {
                              Customer customer = new Customer.parameterized(
                                  nameController.text,
                                  emailController.text,
                                  cellNoController.text);
                              customer.customerDB.addNewCustomer(customer);

                              phoneNumber = cellNoController.text;

                              // loading = true;

                              await _auth.verifyPhoneNumber(
                                phoneNumber: phoneNumber,
                                timeout: Duration(seconds: 60),
                                verificationCompleted:
                                    (AuthCredential credential) async {
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
                                codeSent:
                                    (verificationId, resendingToken) async {
                                  this.verificationId = verificationId;
                                  // loading = false;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyPhone(
                                              phoneNumber: phoneNumber,
                                              verificationId:
                                                  this.verificationId,
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
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kPrimaryColor,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 20),
                              alignment: Alignment.center,
                              child: Text('Sign Up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
