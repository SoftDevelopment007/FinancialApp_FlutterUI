import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/shared_preference.dart';

class coupon_detailProvier extends ChangeNotifier{
bool redeem=false;
void redeem_change(){
  redeem=true;notifyListeners();
}
}

