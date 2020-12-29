import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:tap_animation_kit/tap_animation_kit.dart';

import 'credit_cardDetailProvider.dart';
import 'edit_open.dart';

Widget edit_unlinked(BuildContext context){
  var screenSize = MediaQuery
      .of(context)
      .size;
  return  ChangeNotifierProvider<credit_cardDetailProvider>(
      create: (context) => credit_cardDetailProvider(),
      child: Builder(
          builder: (context) {
            return Consumer<credit_cardDetailProvider>(
                builder: (context, pageProvider, child) {
                  return Material(color:Colors.transparent,child:  Stack(
                    children: <Widget>[
                      // Max Size
                      Container(
                        padding: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/8),
                        margin: EdgeInsets.only(top: screenSize.width*0.21),
                        decoration: BoxDecoration(borderRadius:BorderRadius.only(bottomLeft:Radius.circular(screenSize.width/20),bottomRight: Radius.circular(screenSize.width/20)),color: kBackgoundColor25),
                        height: screenSize.width*0.18,
                        width: screenSize.width*0.84,
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("You get",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: screenSize.width/30),),
                           Container(width: screenSize.width/30,height: screenSize.width/200,decoration: BoxDecoration(color: Colors.white),),
                            Text("HKD",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: screenSize.width/27),),

                          ],),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                        decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft:Radius.circular(screenSize.width/20),topRight: Radius.circular(screenSize.width/20)),gradient: kLinearGradient3),
                        height: screenSize.width*0.21,
                        width: screenSize.width*0.84,
                        child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: screenSize.width/10,),
                            Container(width: screenSize.width/2.5,child: Text("You might want to link your bank account for personalised experience.",textAlign:TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor18,fontSize: screenSize.width/40),),
                            ),
                            SizedBox(width: screenSize.width/40,),
                            Image.asset("assets/add_account1.png", height: screenSize.width/10,)
                          ],),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenSize.width*0.085,top: screenSize.width*0.017),
                        margin: EdgeInsets.only(top:screenSize.width*0.17,left: screenSize.width*0.1),
                        decoration: BoxDecoration( color: kBackgoundColor26,borderRadius: BorderRadius.circular(screenSize.width*0.08)),
                        height:screenSize.width*0.08,
                        width: screenSize.width*0.2,
                        child: Text("Edit",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: screenSize.width/27),),
                      ),
                      GestureDetector(onTap:(){
                      },child: Container(
                        margin: EdgeInsets.only(top:screenSize.width*0.165,left: screenSize.width*0.07),
                        decoration: BoxDecoration( color: kBackgoundColor27,borderRadius: BorderRadius.circular(screenSize.width*0.08)),
                        height:screenSize.width*0.09,
                        width: screenSize.width*0.1,
                        child: Image.asset("assets/recycle.png",height: screenSize.width*0.1,width: screenSize.width*0.1,),

                      ))

                    ],
                  ));
                });}));
}










