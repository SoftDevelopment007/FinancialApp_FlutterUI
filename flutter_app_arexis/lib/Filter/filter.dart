import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_arexis/Credit_Card/credit_card.dart';
import 'package:flutter_app_arexis/ETF/etf.dart';
import 'package:flutter_app_arexis/Filter/credit_card/credit_card_detail.dart';
import 'package:flutter_app_arexis/Filter/etf/asset_class.dart';
import 'package:flutter_app_arexis/Filter/etf/etf_detail.dart';
import 'package:flutter_app_arexis/Filter/term_deposit/term_deposit_detail.dart';
import 'package:flutter_app_arexis/Time_deposit/time_deposit.dart';
import 'etf/sector.dart';
import 'file:///C:/Users/admin/flutter_app_arexis/lib/Filter/etf/region.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../marketplace/marketplaceProvider.dart';
import 'filter_provider.dart';

void showModal(context){
  var screenSize=MediaQuery.of(context).size;
  showCupertinoModalBottomSheet(
      expand: true,
      topRadius: Radius.circular(screenSize.width/10),
  context: context,
  builder: (context) {
  return ChangeNotifierProvider<filterProvider>(
  create: (context) => filterProvider(),
  child: Builder(
  builder: (context) {
  return Consumer<filterProvider>(
  builder: (context, pageProvider, child) {
  return
    Material(child:  ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(screenSize.width/10), topRight: Radius.circular(screenSize.width/10)),
       child: Container(
         width: screenSize.width,
          height:screenSize.height, // your desired height here
          color: Colors.grey.withAlpha(510),
          child: SingleChildScrollView(
              child: Column(
              children: [GestureDetector(onTap:(){
                Navigator.pop(context);
              },child: Container(margin:EdgeInsets.only(top: screenSize.width/15),height: screenSize.width/100, width: screenSize.width/6,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(screenSize.width/10)),)
              ),
                SizedBox(height: screenSize.width/5,),
                GestureDetector(onTap:(){
                     pageProvider.newstep();
                },child:  Text("Product Type",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/18,color: kBackgoundColor18 ),),),
                SizedBox(height: screenSize.width/20,),
                AnimatedContainer(duration:const Duration(milliseconds: 300),height:pageProvider.step==0?screenSize.width*0.5:screenSize.width*0.1,child: Stack(alignment:AlignmentDirectional.topCenter,children: [
                AnimatedPositioned(top:!(pageProvider.k1)?screenSize.width/30:0,duration:const Duration(milliseconds: 300),child:pageProvider.step==0 || pageProvider.step==1?Container(alignment:AlignmentDirectional.center,padding:EdgeInsets.only(left: screenSize.width/30,right: screenSize.width/30,top:screenSize.width/80),height:screenSize.width/10,decoration:BoxDecoration(borderRadius:BorderRadius.circular(screenSize.width/15),color: !(pageProvider.k1)?Colors.transparent:Colors.white24.withOpacity(0.2)),child: GestureDetector(onTap:(){pageProvider.change1();},child: Text("ETF",style: TextStyle(fontWeight:!(pageProvider.k1)?FontWeight.bold:FontWeight.normal,fontSize: screenSize.width/18,color: !(pageProvider.k1)?Colors.white70:Colors.white),))) :Container()) ,
                AnimatedPositioned(top:!(pageProvider.k2)?screenSize.width/5:0,duration:const Duration(milliseconds: 300),child:pageProvider.step==0 || pageProvider.step==2?Container(alignment:AlignmentDirectional.center,padding:EdgeInsets.only(left: screenSize.width/30,right: screenSize.width/30,top:screenSize.width/80),height:screenSize.width/10,decoration:BoxDecoration(borderRadius:BorderRadius.circular(screenSize.width/15),color:!(pageProvider.k2)?Colors.transparent:Colors.white24.withOpacity(0.2)),child: GestureDetector(onTap:(){pageProvider.change2();},child: Text("Credit Card",style: TextStyle(fontWeight:!(pageProvider.k2)?FontWeight.bold:FontWeight.normal,fontSize: screenSize.width/18,color: !(pageProvider.k2)?Colors.white70:Colors.white),))) :Container()) ,
                AnimatedPositioned(top:!(pageProvider.k3)?screenSize.width*11/30:0,duration:const Duration(milliseconds: 300),child:pageProvider.step==0 || pageProvider.step==3?Container(alignment:AlignmentDirectional.center,padding:EdgeInsets.only(left: screenSize.width/30,right: screenSize.width/30,top:screenSize.width/80),height:screenSize.width/10,decoration:BoxDecoration(borderRadius:BorderRadius.circular(screenSize.width/15),color: !(pageProvider.k3)?Colors.transparent:Colors.white24.withOpacity(0.2)),child: GestureDetector(onTap:(){pageProvider.change3();},child: Text("Term Deposit",style: TextStyle(fontWeight:!(pageProvider.k3)?FontWeight.bold:FontWeight.normal,fontSize: screenSize.width/18,color: !(pageProvider.k3)?Colors.white70:Colors.white),))):Container() ) ,
                ],
                ), ),
                pageProvider.step==1?etf_detail(context):Container(),
                pageProvider.step==2?credit_card_detail(context):Container(),
                pageProvider.step==3?term_deposit_detail(context):Container(),
                SizedBox(height: screenSize.width/4,),
                InkWell(onTap:(){
                  if(pageProvider.step==2){Navigator.push(context, MaterialPageRoute(builder:(context) => credit_card()));  }
                  if(pageProvider.step==3){Navigator.push(context, MaterialPageRoute(builder: (context) => time_deposit() ));  }
                  if(pageProvider.step==1){    Navigator.push(context,  MaterialPageRoute(builder: (context) =>  etf() ));}
                },child:Container(width: screenSize.width/3,height: screenSize.width/10,decoration: BoxDecoration(color: Colors.white24.withOpacity(0.2),borderRadius: BorderRadius.circular(screenSize.width/20)),child: Center(child: Text("Search",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/20,color: Colors.white),),),),
                ),
                SizedBox(height: screenSize.width/5,)

              ],
            )
          )
              ),
               ));
         });}));});
}
