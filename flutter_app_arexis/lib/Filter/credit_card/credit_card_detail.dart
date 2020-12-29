import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/Filter/credit_card/features.dart';
import 'package:flutter_app_arexis/Filter/credit_card/reward_type.dart';
import 'package:flutter_app_arexis/Filter/etf/region.dart';
import 'package:flutter_app_arexis/Filter/etf/sector.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';

import '../filter_provider.dart';
import 'card_asssociation.dart';

Widget credit_card_detail(context,){
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
                          pageProvider.change_card_association_flag();print(selectedChoices_card_association);
                        },child:  AnimatedContainer(duration: Duration(milliseconds: 300),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Card Association", style: TextStyle(color: kBackgoundColor18,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width / 18),),
                              pageProvider.card_association_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                                color: Colors.white,)
                            ],),),),
                        pageProvider.card_association_flag?Container():Container(
                            margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                            child:   display_selectedChoices_card_association(selectedChoices_card_association,
                              onSelectionChanged: (selectedList) {

                              },)),
                        pageProvider.card_association_flag?Container(
                          margin: EdgeInsets.only(
                              left: screenSize.width / 5, right: screenSize.width / 5),
                          child: Column(
                            children: [
                              MultiSelectChip_card_association(card_association,
                                onSelectionChanged: (selectedList) {

                                },)
                            ],
                          ),):Container(),


                        GestureDetector(onTap: (){
                          pageProvider.change_reward_type_flag();
                        },child: AnimatedContainer(duration: Duration(milliseconds: 300),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Reward Type", style: TextStyle(color: kBackgoundColor18,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width / 18),),
                              pageProvider.reward_type_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                                color: Colors.white,)
                            ],),), ),
                        pageProvider.reward_type_flag?Container():Container(
                            margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                            child:   display_selectedChoices_reward_type(selectedChoices_reward_type,
                              onSelectionChanged: (selectedList) {

                              },)),
                        pageProvider.reward_type_flag?Container(margin: EdgeInsets.only(
                            left: screenSize.width / 5, right: screenSize.width / 5),
                          child: Column(
                            children: [
                              MultiSelectChip_reward_type(reward_type,
                                onSelectionChanged: (selectedList) {

                                },)
                            ],
                          ),):Container(),

                        GestureDetector(onTap: (){
                          pageProvider.change_feature_flag();
                        },child:  AnimatedContainer(duration: Duration(milliseconds: 300),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Feature", style: TextStyle(color: kBackgoundColor18,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width / 18),),
                              pageProvider.feature_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                                color: Colors.white,)
                            ],),),),
                        pageProvider.feature_flag?Container():Container(
                            margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                            child:   display_MultiSelectChip_feature(selectedChoices_feature,
                              onSelectionChanged: (selectedList) {

                              },)),
                        pageProvider.feature_flag?Container(margin: EdgeInsets.only(
                            left: screenSize.width / 10, right: screenSize.width / 10),
                          child: Column(
                            children: [
                              MultiSelectChip_feature(feature,
                                onSelectionChanged: (selectedList) {

                                },)
                            ],
                          ),):Container(),

                      ],),);
                });}));


}