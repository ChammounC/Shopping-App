import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oyelabs/providers/google_provider.dart';
import 'package:oyelabs/widgets/button.dart';
import 'package:provider/provider.dart';

import '../providers/firebase_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String dropdownvalue = '1';
  bool showLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _signInController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes:['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    var items = [];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
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
                SizedBox(
                  height: size.height / 30,
                ),
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.inter(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height / 13,
                ),
                GestureDetector(
                  onTap: ()async {
                    final LoginResult loginResult = await FacebookAuth.instance.login();

                    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

                    final result = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
                    if(result.user != null){
                      Navigator.pushNamed(context, '/home');
                    }
                    else{
                      _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text('Log In Failed')));
                    }
                  },
                  child: SocialButton('CONTINUE WITH FACEBOOK', Color(0xFF7583CA),
                      'assets/log_in/facebook_icon.png', Color(0xFFF6F1FB)),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                GestureDetector(
                  onTap: (){
                    final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                    provider.googleLogin();
                    Navigator.pushNamed(context, '/auth');
                  },
                  child: SocialButton('CONTINUE WITH GOOGLE', Colors.white,
                      'assets/log_in/google_icon.png', Color(0xFF3F414E)),
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                Text(
                  'OR CONTINUE WITH PHONE NUMBER',
                  style: GoogleFonts.inter(
                    color: Color(0xFF9C9C9C),
                    fontSize: size.height / 57,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 12, vertical: size.height / 40),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: size.height / 13,
                    // width: size.width ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFF2F3F7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                            flex: 2,
                            child: Image.asset(
                              'assets/sign_up/india_flag.png',
                              width: size.width / 15,
                            )),
                        Flexible(
                            flex: 6,
                            child: Text(
                              ' (IND) +91',
                              style: TextStyle(fontSize: size.width / 25),
                            )),
                        DropdownButton(
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          underline: Container(color: Colors.white),
                          // Array list of items
                          items: items
                              .map<DropdownMenuItem<String>>((dynamic items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                        Flexible(
                            flex: 1,
                            child: VerticalDivider(
                              thickness: 0.9,
                              indent: 2,
                              endIndent: 2,
                              color: Colors.black,
                            )),
                        Expanded(
                          flex: 13,
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            controller: _signInController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color(0xFFF2F3F7),
                                ),
                              ),
                              hintText: 'Enter Mobile Number',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: size.width * 0.038,
                              ),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0xFFF2F3F7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () async {
                      if(_signInController.text.length < 10){
                        return;
                      }
                      _signInController.text = '+91'+_signInController.text;
                      context
                          .read<FirebaseProvider>()
                          .addNumber(_signInController.text);
                      setState(() {
                        showLoading = true;
                      });
                      await _auth.verifyPhoneNumber(
                        phoneNumber: _signInController.text,
                        verificationCompleted: (phoneAuthCredential) async {
                          setState(() {
                            showLoading = false;
                          });
                        },
                        verificationFailed: (verificationFailed) {
                          setState(() {
                            showLoading = false;
                          });
                          _scaffoldKey.currentState?.showSnackBar(SnackBar(
                              content: Text(verificationFailed.message!)));
                        },
                        codeSent: (verificationId, resendingToken) async {
                          showLoading = false;
                          context
                              .read<FirebaseProvider>()
                              .receiveCode(verificationId);
                          Navigator.pushNamed(context, '/otp');
                        },
                        codeAutoRetrievalTimeout: (verificationId) async {},
                      );
                      Navigator.pushNamed(context, '/otp');
                    },
                    child: CustomButton('LOG IN')),
                SizedBox(height: size.height / 40),
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.inter(
                      fontSize: size.width / 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height / 20),
                InkWell(
                  onTap: () =>Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RichText(
                        text: TextSpan(
                      text: 'DON\'T HAVE AN ACCOUNT?',
                      style: TextStyle(
                          color: Color(0xFFA1A4B2),
                          fontSize: size.width / 27,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: ' SIGN UP',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
