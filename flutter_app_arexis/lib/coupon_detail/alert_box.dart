import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app_arexis/Credit_Card/credit_cardProvider.dart';
import 'package:flutter_app_arexis/coupon_detail/coupon_detail.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import '../shared_preference.dart';
import 'coupon_detailProvider.dart';

class coupon_alertBox extends StatelessWidget {
  coupon_alertBox(this.onPressed);
  final VoidCallback onPressed;
  Widget build(BuildContext context){
  var screenSize = MediaQuery.of(context).size;
  return ChangeNotifierProvider<coupon_detailProvier>(
      create: (context) => coupon_detailProvier(),
      child: Builder(
      builder: (context)
  {
       return Consumer<coupon_detailProvier>(
        builder: (context, pageProvider,child){
        return Material(color:Colors.transparent,child: Container(
    width: screenSize.width/1.2,height: screenSize.width*1.2,
    decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [kBackgoundColor37,Colors.grey],stops: [0.01,0.25]),borderRadius: BorderRadius.circular(screenSize.width/10)),
    child: Column(
      children: [
        SizedBox(height: screenSize.width/10,),
        Image.asset("assets/check.png",height: screenSize.width/6),
        SizedBox(height: screenSize.width/30,),
        Text("Successful!",style: TextStyle(color: Colors.white,fontSize: screenSize.width/14)),
        SizedBox(height: screenSize.width/9,),
        Text("Here is your code:",style: TextStyle(color: Colors.white,fontSize: screenSize.width/20)),
        Text("XXXX-XXXX-XXXX-XXXX",style: TextStyle(color: Colors.white,fontSize: screenSize.width/20)),
        SizedBox(height: screenSize.width/4,),
        GestureDetector(onTap:(){
          onPressed();
          Navigator.pop(context);
        },child:  Container(width: screenSize.width/3,height: screenSize.width/9,decoration: BoxDecoration(borderRadius:BorderRadius.circular(screenSize.width/10),border: Border.all(color:Colors.white)),child: Center(child: Text("Back",style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),),)
        )
         ],
    ),
  ));});}));
}}