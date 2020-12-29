import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_animation_kit/tap_animation_kit.dart';
import 'etfDetailProvider.dart';
import 'etf_edit_open.dart';

List<String> periods = [
  "1 WK",
  "1 M",
  "1 YR",
  "2 YR",
  "5 YR",
  "10 YR",
  "ALL"
];
int boxaddhsi=1;int boxaddhs=2;
typedef IntValue = int Function(int);
class addtochart extends StatelessWidget {
  addtochart(this.onPressed);
   IntValue onPressed;
  Widget build(BuildContext context){

    var screenSize = MediaQuery
        .of(context)
        .size;
   return ChangeNotifierProvider<etfDetailProvider>(
       create: (context) => etfDetailProvider(),
       child: Builder(
           builder: (context) {
             return Consumer<etfDetailProvider>(
                 builder: (context, pageProvider, child) {
                   return Material(
                     color: Colors.transparent, child: ClipRRect(
                     borderRadius: BorderRadius.only(topLeft: Radius
                         .circular(screenSize.width / 10),
                         topRight: Radius.circular(
                             screenSize.width / 10)),
                     child: Container(
                         padding: EdgeInsets.only(
                             left: screenSize.width / 10,
                             right: screenSize.width / 10),
                         width: screenSize.width,
                         height: screenSize.height * 0.3,
                         // your desired height here
                         color: kBackgoundColor38.withOpacity(0.9),
                         child: Column(
                             children: [
                               GestureDetector(onTap: () {
                                 Navigator.pop(context);
                               },
                                   child: Container(
                                     margin: EdgeInsets.only(
                                         top: screenSize.width / 15),
                                     height: screenSize.width / 100,
                                     width: screenSize.width / 6,
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius
                                             .circular(
                                             screenSize.width / 10)),)
                               ),
                               SizedBox(height: screenSize.width / 30,),
                               Text("Add to Chart", style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: screenSize.width / 18,
                                   color: Colors.black),),
                               SizedBox(height: screenSize.width / 15,),
                               Row(mainAxisAlignment: MainAxisAlignment
                                   .spaceBetween,
                                   children: [
                                     Container(
                                       padding: EdgeInsets.only(
                                           left: screenSize.width / 50),
                                       height: screenSize.width / 10,
                                       width: screenSize.width / 3,
                                       child: Row(children: [
                                         Container(
                                           margin: EdgeInsets.only(
                                               right: screenSize.width /
                                                   40),
                                           height: screenSize.width / 70,
                                           width: screenSize.width / 20,
                                           decoration: BoxDecoration(
                                               color: Colors
                                                   .pinkAccent),),
                                         Text("HSI", style: TextStyle(
                                             color: Colors.white,
                                             fontSize: screenSize.width /
                                                 20),)
                                       ],),
                                     ),
                                     GestureDetector(onTap: () {
                                      boxaddhsi==1?boxaddhsi=3:boxaddhsi=1;pageProvider.putchart(boxaddhsi); onPressed(boxaddhsi);
                                     },
                                         child: Container(
                                           width: screenSize.width / 12,
                                           height: screenSize.width / 12,
                                           decoration: BoxDecoration(
                                               boxShadow: [
                                                 BoxShadow(
                                                   color: Colors.grey
                                                       .withOpacity(0.5),
                                                   spreadRadius: 3,
                                                   blurRadius: 3,
                                                   offset: Offset(0,
                                                       3), // changes position of shadow
                                                 ),
                                               ],
                                               borderRadius: BorderRadius
                                                   .circular(
                                                   screenSize.width /
                                                       20),
                                               color: pageProvider.addhsi==1? Colors
                                                   .lightGreen : Colors
                                                   .white60),))
                                   ]),
                               SizedBox(height: screenSize.width / 20,),
                               Row(mainAxisAlignment: MainAxisAlignment
                                   .spaceBetween,
                                   children: [
                                     Container(
                                       padding: EdgeInsets.only(
                                           left: screenSize.width / 50),
                                       height: screenSize.width / 10,
                                       width: screenSize.width / 3,
                                       child: Row(children: [
                                         Container(
                                           margin: EdgeInsets.only(
                                               right: screenSize.width /
                                                   40),
                                           height: screenSize.width / 70,
                                           width: screenSize.width / 20,
                                           decoration: BoxDecoration(
                                               color: Colors.blue),),
                                         Text("S&P 500",
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: screenSize
                                                   .width / 20),)
                                       ],),
                                     ),
                                     GestureDetector(onTap: () {
                                       boxaddhs==2?boxaddhs=4:boxaddhs=2;pageProvider.putchart(boxaddhs);onPressed(boxaddhs);
                                     },
                                         child: Container(
                                           width: screenSize.width / 12,
                                           height: screenSize.width / 12,
                                           decoration: BoxDecoration(
                                               boxShadow: [
                                                 BoxShadow(
                                                   color: Colors.grey
                                                       .withOpacity(0.5),
                                                   spreadRadius: 3,
                                                   blurRadius: 3,
                                                   offset: Offset(0,
                                                       3), // changes position of shadow
                                                 ),
                                               ],
                                               borderRadius: BorderRadius
                                                   .circular(
                                                   screenSize.width /
                                                       20),
                                               color:pageProvider.addhs==2? Colors
                                                   .lightGreen : Colors
                                                   .white60),))
                                   ]),
                             ]
                         )
                     ),
                   ),);
                 }
             );
           }
       ));
  }
}