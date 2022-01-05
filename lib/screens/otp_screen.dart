import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:oyelabs/providers/firebase_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _otpController = TextEditingController();

  bool showLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  FirebaseAuth _auth = FirebaseAuth.instance;
  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async{
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = true;
      });
      if(authCredential.user != null){
        Navigator.pushNamed(context, '/location');
      }
    } on FirebaseAuthException catch (e) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  String pin = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: showLoading?Center(child:CircularProgressIndicator()):SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                      padding: EdgeInsets.all(size.width / 12),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/back_arrow.png',
                            width: size.width / 10,
                          ))),
                ),
                Image.asset('assets/otp/otp.png', width: size.width / 2.5),
                SizedBox(height: size.height / 15),
                Text(
                  'OTP Verification',
                  style: GoogleFonts.raleway(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 35),
                RichText(
                  text: TextSpan(
                    text: 'Enter the OTP sent to ',
                    style: GoogleFonts.inter(
                        color: Colors.black, fontSize: size.width * 0.04),
                    children: [
                      TextSpan(
                          text:
                              '${context.watch<FirebaseProvider>().number}',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(height: size.height / 18),
                OtpTextField(
                  keyboardType: TextInputType.number,
                  textStyle: GoogleFonts.raleway(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                  numberOfFields: 6,
                  onSubmit: (String verificationCode) async{
                    pin = verificationCode;
                    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: Provider.of<FirebaseProvider>(context,listen: false).verificationId, smsCode: pin);

                    signInWithPhoneAuthCredential(phoneAuthCredential);
                    if (Provider.of<FirebaseProvider>(context,listen: false).verificationId ==
                        verificationCode) {
                      Navigator.pushNamed(context, '/location');
                    } else {
                      _scaffoldKey.currentState?.showSnackBar(
                          SnackBar(content: Text('Invalid OTP')));
                    }
                    context.read<FirebaseProvider>().addNumber('');
                  },
                ),
                SizedBox(height: size.height / 45),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RichText(
                        text: TextSpan(
                      text: 'OTP not received? ',
                      style: GoogleFonts.inter(
                          color: Color(0xFFA1A4B2),
                          fontSize: size.width / 27,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: 'RESEND OTP',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    )),
                  ),
                ),
                SizedBox(height: size.height / 25),
                GestureDetector(
                    onTap: () {
                      if (Provider.of<FirebaseProvider>(context,listen: false).verificationId ==
                          pin) {
                        Navigator.pushNamed(context, '/location');
                      } else {
                        _scaffoldKey.currentState?.showSnackBar(
                            SnackBar(content: Text('Invalid OTP')));
                      }
                      context.read<FirebaseProvider>().addNumber('');
                    },
                    child: CustomButton('VERIFY AND PROCEED')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


