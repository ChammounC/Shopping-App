import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oyelabs/providers/firebase_provider.dart';
import 'package:oyelabs/widgets/button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _signUpController = TextEditingController();

  String dropdownvalue = '';

  FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool showLoading = false;
  @override
  Widget build(BuildContext context) {
    var items = [];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: showLoading?Center(child:CircularProgressIndicator()):SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildDesign(size),
              Text(
                'Your Home services Expert',
                style: GoogleFonts.raleway(
                    fontSize: size.height / 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Continue with phone Number',
                style: GoogleFonts.inter(
                  color: Color(0xFF9C9C9C),
                  fontSize: size.height / 47,
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
                          controller: _signUpController,
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
                onTap: ()async {
                  if(_signUpController.text.length < 10){
                    return;
                  }
                  context.read<FirebaseProvider>().addNumber(_signUpController.text);
                  _signUpController.text = '+91'+_signUpController.text;
                  setState(() {
                    showLoading = true;
                  });
                  await _auth.verifyPhoneNumber(
                    phoneNumber: _signUpController.text,
                    verificationCompleted: (phoneAuthCredential)async{
                      setState(() {
                        showLoading = false;
                      });
                    },
                    verificationFailed: (verificationFailed){
                      setState(() {
                        showLoading = false;
                      });
                      _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(verificationFailed.message!)));
                    },
                    codeSent: (verificationId, resendingToken)async{
                      showLoading = false;
                      context.read<FirebaseProvider>().receiveCode(verificationId);
                      Navigator.pushNamed(context, '/otp');
                    },
                    codeAutoRetrievalTimeout: (verificationId)async{
                    },
                  );
                },
                child: CustomButton('SIGN UP'),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/logIn'),
                  child: Text('VIEW OTHER OPTION',
                      style: GoogleFonts.inter(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5A77FF))),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/logIn'),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RichText(
                      text: TextSpan(
                    text: 'ALREADY HAVE AN ACCOUNT?',
                    style: TextStyle(
                        color: Color(0xFFA1A4B2),
                        fontWeight: FontWeight.bold,
                        fontSize: size.width / 27),
                    children: [
                      TextSpan(
                          text: ' LOG IN',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildDesign(Size size) {
    return Stack(
      children: [
        Image.asset(
          'assets/sign_up/Vector@2x.png',
        ),
        Column(
          children: [
            SizedBox(
              height: size.height / 6,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/sign_up/Group@2x.png',
                  width: size.width * 0.85,
                )),
            SizedBox(
              height: size.height / 23,
            ),
            Image.asset('assets/sign_up/Vector@2x-1.png'),
          ],
        ),
      ],
    );
  }
}
