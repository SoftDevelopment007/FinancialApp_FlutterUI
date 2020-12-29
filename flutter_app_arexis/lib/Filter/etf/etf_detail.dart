import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/Filter/etf/region.dart';
import 'package:flutter_app_arexis/Filter/etf/sector.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';

import '../filter_provider.dart';
import 'asset_class.dart';

Widget etf_detail(context){
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
            pageProvider.change_region_flag();
          },child:  AnimatedContainer(duration: Duration(milliseconds: 300),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Region", style: TextStyle(color: kBackgoundColor18,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width / 18),),
                pageProvider.region_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                  color: Colors.white,)
              ],),),),
            pageProvider.region_flag?Container():Container(
              margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
              child:   display_MultiSelectChip_region(selectedChoices_region,
                onSelectionChanged: (selectedList) {

                },)),
            pageProvider.region_flag?Container(
              margin: EdgeInsets.only(
              left: screenSize.width / 5, right: screenSize.width / 5),
            child: Column(
              children: [
                MultiSelectChip_region(region,
                  onSelectionChanged: (selectedList) {

                  },)
              ],
            ),):Container(),


            GestureDetector(onTap: (){
            pageProvider.change_asset_class_flag();
          },child: AnimatedContainer(duration: Duration(milliseconds: 300),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Asset Class", style: TextStyle(color: kBackgoundColor18,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width / 18),),
                pageProvider.asset_class_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                  color: Colors.white,)
              ],),), ),
            pageProvider.asset_class_flag?Container():Container(
                margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                child:   display_MultiSelectChip_asset_class(selectedChoices_asset_class,
                  onSelectionChanged: (selectedList) {

                  },)),
            pageProvider.asset_class_flag?Container(margin: EdgeInsets.only(
              left: screenSize.width / 5, right: screenSize.width / 5),
            child: Column(
              children: [
                MultiSelectChip_asset_class(asset_class,
                  onSelectionChanged: (selectedList) {

                  },)
              ],
            ),):Container(),

            GestureDetector(onTap: (){
            pageProvider.change_sector_flag();
          },child:  AnimatedContainer(duration: Duration(milliseconds: 300),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sector", style: TextStyle(color: kBackgoundColor18,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width / 18),),
                pageProvider.sector_flag?Icon(Icons.keyboard_arrow_down,size: screenSize.width/10,color: Colors.white,):Icon(Icons.navigate_next, size: screenSize.width / 10,
                  color: Colors.white,)
              ],),),),
            pageProvider.sector_flag?Container():Container(
                margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                child:   display_MultiSelectChip_sector(selectedChoices_sector,
                  onSelectionChanged: (selectedList) {

                  },)),
            pageProvider.sector_flag?Container(margin: EdgeInsets.only(
              left: screenSize.width / 10, right: screenSize.width / 10),
            child: Column(
              children: [
                MultiSelectChip_sector(sector,
                  onSelectionChanged: (selectedList) {

                  },)
              ],
            ),):Container(),

        ],),);
    });}));


}