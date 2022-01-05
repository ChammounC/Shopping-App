import 'package:flutter/material.dart';

class FirebaseProvider with ChangeNotifier{
  String verificationId = '';
  String number = '';
  String get code => verificationId;
  void receiveCode(String code){
    verificationId = code;
    notifyListeners();
  }
  void addNumber(String number){
    this.number = number;
    notifyListeners();
  }
}