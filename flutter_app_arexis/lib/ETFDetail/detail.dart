import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'etfDetailProvider.dart';

void showDetailModal(context,etf) {
  var screenSize = MediaQuery
      .of(context)
      .size;
  showCupertinoModalBottomSheet(
      expand: true,
      topRadius: Radius.circular(screenSize.width/10),
      context: context,
      builder: (context) {
        return ChangeNotifierProvider<etfDetailProvider>(
            create: (context) => etfDetailProvider(),
            child: Builder(
                builder: (context) {
                  return Consumer<etfDetailProvider>(
                      builder: (context, pageProvider, child) {
                        final bond_widgets=<Widget>[];
                        for(int i=0;i<etf.length;i++){
                          bond_widgets.add(
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(child: Row(children: [
                                  Container(width: screenSize.width/50,height:screenSize.width/50,margin:EdgeInsets.only(right: screenSize.width/60),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(screenSize.width/60)),child: Text(""),),
                                  Text("Technology",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40,),),
                                ],),),
                                Text("44.40%",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40,),),
                              ],),
                          );
                        }


                        return Material(
                          color: Colors.transparent, child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(screenSize.width / 10),
                              topRight: Radius.circular(
                                  screenSize.width / 10)),
                          child: Container(
                              width: screenSize.width,
                              height: screenSize.height * 0.78,
                              // your desired height here
                              color: kBackgoundColor1.withAlpha(510),
                              child: SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom:screenSize.width/15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        GestureDetector(onTap: () {
                                          Navigator.pop(context);
                                        },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: screenSize.width * 5 /
                                                      12,
                                                  top: screenSize.width / 15),
                                              height: screenSize.width / 100,
                                              width: screenSize.width / 6,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      screenSize.width / 10)),)
                                        ),
                                        SizedBox(
                                          height: screenSize.width / 15,),
                                        Container(margin: EdgeInsets.only(
                                            left: screenSize.width / 10,
                                            bottom: screenSize.width / 30),
                                          child: Text("Details",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenSize.width / 20,
                                                color: Colors.white),),),
                                        Container(margin: EdgeInsets.only(
                                            left: screenSize.width / 10,
                                            right: screenSize.width / 10,
                                            bottom: screenSize.width / 20),
                                          width: screenSize.width * 0.8,
                                          child: Text(
                                                      etf['description'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenSize.width /
                                                    30),),),
                                        Row(children: [
                                          Container(margin:EdgeInsets.only(left: screenSize.width/15,right: screenSize.width/80),width: screenSize.width / 2,
                                              child: PieChart(
                                                dataMap: pageProvider.dataMap,
                                                animationDuration: Duration(
                                                    milliseconds: 800),
                                                chartLegendSpacing: screenSize.width/10,
                                                chartRadius: MediaQuery.of(context).size.width / 2,
                                                initialAngleInDegree: 270,
                                                chartType: ChartType.disc,
                                                ringStrokeWidth:  screenSize.width/10,
                                                colorList: [kBackgoundColor19,kBackgoundColor20],
                                                legendOptions: LegendOptions(
                                                  showLegendsInRow: false,
                                                  showLegends: false,
                                                  legendTextStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                chartValuesOptions: ChartValuesOptions(
                                                  showChartValueBackground: false,
                                                  showChartValues: false,
                                                  showChartValuesInPercentage: false,
                                                  showChartValuesOutside: false,
                                                ),
                                              )
                                          ),
                                          Column(children: [
                                            Container(width: screenSize.width/2.6,margin:EdgeInsets.only(bottom: screenSize.width/30),padding:EdgeInsets.only(top:screenSize.width/40,left: screenSize.width/30,right: screenSize.width/30,bottom: screenSize.width/40),decoration: BoxDecoration(color: kBackgoundColor21,borderRadius: BorderRadius.circular(screenSize.width/30)),
                                              child: Column(
                                                children: [
                                                  Row(children: [
                                                    Text(etf['asset_class'],style: TextStyle(color: Colors.white,fontSize: screenSize.width/30,),),
                                                  ],),
                                                  SizedBox(height: screenSize.width/100,),


                                                ],
                                              ),),

                                            Container(width: screenSize.width/2.6,padding:EdgeInsets.only(top:screenSize.width/40,left: screenSize.width/30,right: screenSize.width/30,bottom: screenSize.width/40),decoration: BoxDecoration(color: kBackgoundColor22,borderRadius: BorderRadius.circular(screenSize.width/30)),
                                              child: Column(
                                                children: [
                                                  Row(children: [
                                                    Text("Bonds",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30,),),
                                                  ],),
                                                  SizedBox(height: screenSize.width/100,),
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(child: Row(children: [
                                                        Container(width: screenSize.width/50,height:screenSize.width/50,margin:EdgeInsets.only(right: screenSize.width/60),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(screenSize.width/60)),child: Text(""),),
                                                        Text("Technology",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40,),),
                                                      ],),),
                                                      Text("44.40%",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40,),),
                                                    ],),
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(child: Row(children: [
                                                        Container(width: screenSize.width/50,height:screenSize.width/50,margin:EdgeInsets.only(right: screenSize.width/60),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(screenSize.width/60)),child: Text(""),),
                                                        Text("Technology",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40,),),
                                                      ],),),
                                                      Text("44.40%",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40,),),
                                                    ],),
                                                ],
                                              ),)
                                          ],)
                                        ],)

                                      ],
                                    ),
                                  )
                              )

                          ),
                        ),);
                      }
                  );
                }
            ));
      });
}