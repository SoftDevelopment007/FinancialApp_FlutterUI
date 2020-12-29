import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
import 'package:flutter_app_arexis/credit_cardDetail/edit_unlinked.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_animation_kit/tap_animation_kit.dart';


List<String> periods = [
  "1 WK",
  "1 M",
  "1 YR",
  "2 YR",
  "5 YR",
  "10 YR",
  "ALL"
];


void showcredit_cardDetail_Simulation_unlinkedModal(context) {
  var screenSize = MediaQuery
      .of(context)
      .size;
  showCupertinoModalBottomSheet(
      expand: true,
      topRadius: Radius.circular(screenSize.width/10),
      context: context,
      builder: (context) {
        return ChangeNotifierProvider<credit_cardDetailProvider>(
            create: (context) => credit_cardDetailProvider(),
            child: Builder(
                builder: (context) {
                  return Consumer<credit_cardDetailProvider>(
                      builder: (context, pageProvider, child) {
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
                                        Container(margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10,),child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Simulation",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenSize.width / 20,
                                                  color: Colors.white),),
                                          ],),),
                                        Container(margin:EdgeInsets.only(top: screenSize.width/20,left: screenSize.width/10),child: Row(
                                          children: [
                                            Text("Historical Backtest Return",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
                                            Container(margin:EdgeInsets.only(left: screenSize.width/40),width: screenSize.width/15,height:screenSize.width/15,child:Center(child: Image.asset("assets/quot.png",height: screenSize.width/25,),),decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(screenSize.width/30)),)
                                          ],
                                        ),),
                                        Container(margin:EdgeInsets.only(top: screenSize.width/20,left: screenSize.width/10),child: Row(
                                          children: [
                                            Text("From ",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/28,color: Colors.white),),
                                            Text("20 MAR 2020 ",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/28,color: kBackgoundColor18),),
                                            Text("to ",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/28,color: Colors.white),),
                                            Text("20 APR 2020:",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/28,color: kBackgoundColor18),),
                                          ],
                                        ),),
                                        Container(margin:EdgeInsets.only(left: screenSize.width*0.08,top:screenSize.width/30),
                                            child: edit_unlinked(context)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(margin:EdgeInsets.only(top: screenSize.width/10,bottom:screenSize.width/40,left: screenSize.width/10),child: Row(
                                              children: [
                                                Text("Saving by category",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
                                              ],
                                            ),),
                                          ],),

                                        Container(width: screenSize.width*0.84,margin: EdgeInsets.only(left: screenSize.width*0.08),padding: EdgeInsets.only(left: screenSize.width*0.04,right: screenSize.width*0.04,top: screenSize.width*0.04,bottom: screenSize.width*0.04),decoration:BoxDecoration(color: kBackgoundColor30,borderRadius: BorderRadius.circular(screenSize.width/30)),
                                            child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                              Container(width: screenSize.width/1.5,child: Text("You might want to link your bank account for personalised experience.",textAlign:TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor18,fontSize: screenSize.width/40),),)

                                              ],)),
                                        Container(margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10,top: screenSize.width/10,bottom: screenSize.width/10),child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Historical Backtest Return",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
                                          ],),),
                                        Stack(children: [
                                          Container(
                                            width: screenSize.width,
                                            height: screenSize.width*0.6,
                                            margin: EdgeInsets.only(
                                                left: screenSize.width / 20,
                                                right: screenSize.width / 30),
                                            child: SfCartesianChart(

                                                trackballBehavior: TrackballBehavior(
                                                    enable: true,
                                                    shouldAlwaysShow: true,
                                                    tooltipAlignment: ChartAlignment.near,
                                                    tooltipDisplayMode: TrackballDisplayMode
                                                        .groupAllPoints,
                                                    markerSettings: TrackballMarkerSettings(
                                                        markerVisibility: TrackballVisibilityMode
                                                            .auto,
                                                        width: 6,
                                                        height: 6,
                                                        color: Colors.tealAccent,
                                                        borderWidth: 5),
                                                    lineType: TrackballLineType.vertical,
                                                    lineColor: Colors.white60,
                                                    lineWidth: 1,
                                                    activationMode: ActivationMode
                                                        .singleTap,
                                                    tooltipSettings:
                                                    InteractiveTooltip(
                                                        format: 'point.y',
                                                        borderWidth: 3,
                                                        borderColor: Colors.transparent,
                                                        color: Colors.white38,
                                                        textStyle: ChartTextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize.width /
                                                                30,
                                                            fontWeight: FontWeight.w800))
                                                ),
                                                plotAreaBorderColor: Colors.transparent,
                                                primaryXAxis: DateTimeAxis(
                                                    labelStyle: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    axisLine: AxisLine(width: 0),
                                                    majorTickLines: MajorTickLines(width: 0),
                                                    edgeLabelPlacement: EdgeLabelPlacement
                                                        .shift,
                                                    interval: 1,
                                                    intervalType: DateTimeIntervalType
                                                        .years,
                                                    majorGridLines: MajorGridLines(
                                                        width: 0,
                                                        color: Colors.red,
                                                        dashArray: <double>[5, 5]
                                                    ),
                                                    minorGridLines: MinorGridLines(
                                                        width: 0,
                                                        color: Colors.green,
                                                        dashArray: <double>[5, 5]
                                                    ),
                                                    minorTicksPerInterval: 0
                                                ),
                                                primaryYAxis: NumericAxis(
                                                    minimum: 160,
                                                    maximum: 220,
                                                    labelStyle: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    majorTickLines: MajorTickLines(width: 0),
                                                    axisLine: AxisLine(width: 0),
                                                    opposedPosition: false,
                                                    majorGridLines: MajorGridLines(
                                                        width: 0,
                                                        color: Colors.red,
                                                        dashArray: <double>[5, 5]
                                                    ),
                                                    minorGridLines: MinorGridLines(
                                                        width: 0,
                                                        color: Colors.green,
                                                        dashArray: <double>[5, 5]
                                                    ),
                                                    minorTicksPerInterval: 0
                                                ),

                                                series: <ChartSeries>[
                                                  // Renders area chart
                                                  AreaSeries<SalesData_credit, DateTime>(
                                                      color: Colors.transparent,
                                                      markerSettings: MarkerSettings(
                                                          isVisible: true,
                                                          borderWidth: 0,
                                                          width: 0),
                                                      borderColor: Colors.transparent,
                                                      borderWidth: 0,
                                                      dataSource: pageProvider.chartData_return_HSI,
                                                      xValueMapper: (SalesData_credit sales,
                                                          _) => sales.year,
                                                      yValueMapper: (SalesData_credit sales,
                                                          _) => sales.sales
                                                  )
                                                ]
                                            ),),
                                          Container(margin:EdgeInsets.only(top: screenSize.width/5,left: screenSize.width/5),width: screenSize.width/1.5,child: Text("You might want to link your bank account for personalised experience.",textAlign:TextAlign.center,style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor18,fontSize: screenSize.width/40),),)

                                        ],)
                                        /////////////////////////////////////////// Hard Chart

                                        ///////////////////////////////////////////

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