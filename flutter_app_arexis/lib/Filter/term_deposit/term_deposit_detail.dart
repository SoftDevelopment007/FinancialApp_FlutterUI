import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/Filter/etf/asset_class.dart';
import 'package:flutter_app_arexis/Filter/etf/region.dart';
import 'package:flutter_app_arexis/Filter/etf/sector.dart';
import 'package:flutter_app_arexis/Filter/term_deposit/term_period.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';

import '../filter_provider.dart';
import 'currency.dart';

Widget term_deposit_detail(context){
  var screenSize=MediaQuery.of(context).size;
  return  ChangeNotifierProvider<filterProvider>(
      create: (context) => filterProvider(),
      child: Builder(
          builder: (context) {
            return Consumer<filterProvider>(
                builder: (context, pageProvider, child)
                {
                  return
                    Container(
                      child: Column(children:
                      [
                        SizedBox(height: screenSize.width / 30,),
                        GestureDetector(onTap:(){
                          pageProvider.change_term_period_flag();
                        },child:  AnimatedContainer(duration: Duration(milliseconds: 300),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Term Period", style: TextStyle(color: kBackgoundColor18,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width / 18),),
                              pageProvider.term_period_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                                color: Colors.white,)
                            ],),),),
                        pageProvider.term_period_flag?Container():Container(
                            margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                            child:   display_MultiSelectChip_term_period(selectedChoices_term_period,
                              onSelectionChanged: (selectedList) {

                              },)),
                        pageProvider.term_period_flag?Container(
                          margin: EdgeInsets.only(
                              left: screenSize.width / 5, right: screenSize.width / 5),
                          child: Column(
                            children: [
                              MultiSelectChip_term_period(term_period,
                                onSelectionChanged: (selectedList) {

                                },)
                            ],
                          ),):Container(),


                        GestureDetector(onTap: (){
                          pageProvider.change_asset_class_flag();
                        },child: AnimatedContainer(duration: Duration(milliseconds: 300),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Currency", style: TextStyle(color: kBackgoundColor18,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width / 18),),
                              pageProvider.asset_class_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                                color: Colors.white,)
                            ],),), ),
                        pageProvider.asset_class_flag?Container():Container(
                            margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                            child:   display_MultiSelectChip_currency(selectedChoices_currency,
                              onSelectionChanged: (selectedList) {

                              },)),
                        pageProvider.asset_class_flag?Container(margin: EdgeInsets.only(
                            left: screenSize.width / 10, right: screenSize.width / 10),
                          child: Column(
                            children: [
                              MultiSelectChip_currency(currency,
                                onSelectionChanged: (selectedList) {

                                },)
                            ],
                          ),):Container(),



                      ],),);
                });}));


}