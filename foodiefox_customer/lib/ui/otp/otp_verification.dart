import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';
import 'package:foodiefox_customer/ui/home/main_HomePage.dart';
import 'package:foodiefox_customer/ui/models/Data.dart';
import 'components/numeric_pad.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({@required this.cellNumber});
  final String cellNumber;

  @override
  _OTPVerification createState() => _OTPVerification();
}

class _OTPVerification extends State<OTPVerification> {
  String _otpCode = "";
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _firebaseAuthVerificationId;

  @override
  void initState() {
    super.initState();
    _otpRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
        title: Text(
          "OTP Verification",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      child: Text("Code sent to " + widget.cellNumber,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF818181),
                          )),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildCodeNumberBox(_otpCode.length > 0
                              ? _otpCode.substring(0, 1)
                              : ""),
                          _buildCodeNumberBox(_otpCode.length > 1
                              ? _otpCode.substring(1, 2)
                              : ""),
                          _buildCodeNumberBox(_otpCode.length > 2
                              ? _otpCode.substring(2, 3)
                              : ""),
                          _buildCodeNumberBox(_otpCode.length > 3
                              ? _otpCode.substring(3, 4)
                              : ""),
                          _buildCodeNumberBox(_otpCode.length > 4
                              ? _otpCode.substring(4, 5)
                              : ""),
                          _buildCodeNumberBox(_otpCode.length > 5
                              ? _otpCode.substring(5, 6)
                              : ""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          PhoneAuthCredential phoneAuthCredential =
                              PhoneAuthProvider.credential(
                                  smsCode: _otpCode,
                                  verificationId: _firebaseAuthVerificationId);

                          _signInWithPhoneAuthCredential(phoneAuthCredential);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: primary_Yellow,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Verify Account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NumericPad(onNumberSelected: (value) {
              setState(() {
                if (value != -1) {
                  if (_otpCode.length < 6) {
                    _otpCode = _otpCode + value.toString();
                  }
                } else {
                  _otpCode = _otpCode.substring(0, _otpCode.length - 1);
                }
              });
            })
          ],
        ),
      ),
    );
  }

  Widget _buildCodeNumberBox(String otpCodeBlock) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 45,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFF6F5FA),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75),
                ),
              ]),
          child: Center(
            child: Text(otpCodeBlock,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1F1F),
                )),
          ),
        ),
      ),
    );
  }

  void _otpRequest() {
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: widget.cellNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) async {
        setState(() {
          _otpCode = phoneAuthCredential.smsCode;
        });
        _signInWithPhoneAuthCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {},
      codeSent: (verificationId, resendingToken) async {
        _firebaseAuthVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  void _signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);

    if (userCredential?.user != null) {
      await getRestaurants();

      Navigator.of(context).pop();
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('Login Unsuccessful!!'),
        backgroundColor: primary_Yellow,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
