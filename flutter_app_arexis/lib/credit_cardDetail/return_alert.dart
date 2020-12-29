import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app_arexis/Credit_Card/credit_cardProvider.dart';
import 'package:flutter_app_arexis/coupon_detail/coupon_detail.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import '../shared_preference.dart';

class return_alertBox extends StatelessWidget {
  Widget build(BuildContext context){
    var screenSize = MediaQuery.of(context).size;
    return  Material(color:Colors.transparent,child: Container(
      width: screenSize.width/1.4,height: screenSize.width,
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [kBackgoundColor37,Colors.grey],stops: [0.01,0.25]),borderRadius: BorderRadius.circular(screenSize.width/10)),
      child: Column(
        children: [
          SizedBox(height: screenSize.width/20,),
          Image.asset("assets/quetion.png",height: screenSize.width/6),
          SizedBox(height: screenSize.width/30,),
          Text("Tips!",style: TextStyle(color: Colors.white,fontSize: screenSize.width/14)),
          SizedBox(height: screenSize.width/12,),
          Row(children: [ SizedBox(width: screenSize.width/10),Text("Return Simulator",style: TextStyle(color: Colors.white,fontSize: screenSize.width/20)),],),
          Row(children: [ SizedBox(width: screenSize.width/10),Container(width: screenSize.width/1.8,child: Text("Pop up box: What if I invest \$xxx on this 1 year ago.",style: TextStyle(color: Colors.white,fontSize: screenSize.width/25)), )],),
          SizedBox(height: screenSize.width/7,),
          GestureDetector(onTap:(){
            Navigator.pop(context);
          },child:  Container(width: screenSize.width/3,height: screenSize.width/9,decoration: BoxDecoration(borderRadius:BorderRadius.circular(screenSize.width/10),border: Border.all(color:Colors.white)),child: Center(child: Text("Back",style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),),)
          )
        ],
      ),
    ));
  }}