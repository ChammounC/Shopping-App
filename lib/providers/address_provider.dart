import 'package:flutter/material.dart';

class AddressProvider with ChangeNotifier{
  late String string = '';
  String get address => string;
  void setAddress(String adrs){
    string = adrs;
    notifyListeners();
  }
}