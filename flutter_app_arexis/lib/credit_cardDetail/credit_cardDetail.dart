import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/chart.dart';
import 'package:flutter_app_arexis/ETFDetail/detail.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetailProvider.dart';
import 'package:flutter_app_arexis/ETFDetail/peer.dart';
import 'package:flutter_app_arexis/ETFDetail/simulation.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail_detail.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail_offer.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDtail_peer.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDtail_simulation.dart';
import 'package:flutter_app_arexis/credit_cardDetail/return_alert.dart';

import 'package:flutter_app_arexis/models/credit_card_list.dart';
import 'package:flutter_app_arexis/models/credit_card_list.dart';
import 'package:flutter_app_arexis/models/credit_card_list.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'credit_cardDetailProvider.dart';
import 'credit_cardDetail_simulation_unlinked.dart';

class credit_cardDetail extends StatelessWidget {

  List<String> periods = [
    "1 WK",
    "1 M",
    "3 M",
    "6 M",
    "1 YR",
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return ChangeNotifierProvider<credit_cardDetailProvider>(
        create: (context) => credit_cardDetailProvider(),
        child: Builder(
            builder: (context) {
              return Consumer<credit_cardDetailProvider>(
                builder: (context, pageProvider, child) {
                  return Scaffold(
                      backgroundColor: kBackgoundColor,
                      appBar: AppBar(
                        centerTitle: true,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        title: Text(""),
                        flexibleSpace: Container(
                          decoration: BoxDecoration(color: kBackgoundColor),
                        ),
                        actions: [
                          IconButton(
                              icon: Image.asset(
                                "assets/portfolio.png",
                                height: screenSize.width / 15,
                              ),
                              onPressed: () {}),
                          SizedBox(width: screenSize.width / 20)
                        ],
                      ),
                      body: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return;
                          },
                          child: SingleChildScrollView(
                              child:FutureBuilder(
                        future: pageProvider.getCreditCarddetail(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final credit_card_detail=snapshot.data;
                            pageProvider.put_chartData(credit_card_detail);
                            return  Container(
                              padding: EdgeInsets.only(
                                  bottom: screenSize.width / 10),
                              decoration: BoxDecoration(color: kBackgoundColor),
                              child: Column(
                                children: [
                                  Container(margin: EdgeInsets.only(left: screenSize.width/12,top: screenSize.width/20,bottom:  screenSize.width/15),child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(children: [
                                        Container(
                                            height:screenSize.width/8 ,
                                            width: screenSize.width/5.5,
                                            child: Image.network(credit_card_detail['imgURL'],fit: BoxFit.cover,)
                                        ),
                                      ],),
                                      SizedBox(width: screenSize.width/20),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(

                                            child:Text(credit_card_detail['bank_name'], overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
                                          ),
                                          Container(
                                            width: screenSize.width/1.5,
                                            child:Text(credit_card_detail['product_name'], overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/22,color:Colors.white),),
                                          ),
                                          SizedBox(height: screenSize.width/72),
                                          Row(children: [
                                            Text("+${credit_card_detail['saved_amount'].toStringAsFixed(2)}",style: TextStyle(fontSize:screenSize.width/16,color:kBackgoundColor4),),
                                            SizedBox(width: screenSize.width/30,),
                                            Column(
                                              children: [
                                                SizedBox(height: screenSize.width/70,),
                                                Text("Saved money",style: TextStyle(fontSize:screenSize.width/30,color:kBackgoundColor4),),
                                              ],
                                            )

                                          ],)

                                        ],
                                      )
                                    ],
                                  ), ),

                                  Container(
                                    padding: EdgeInsets.only(
                                        left: screenSize.width / 8,
                                        right: screenSize.width / 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        GestureDetector(onTap: () {
                                          showcredit_cardDetail_detaillModal(context,credit_card_detail);
                                        }, child: Container(
                                          width: screenSize.width / 2.8,
                                          height: screenSize.width / 10,
                                          decoration: BoxDecoration(
                                              color: kBackgoundColor5,
                                              borderRadius: BorderRadius.circular(
                                                  screenSize.width / 15)),
                                          child: Center(child: Text("Detail",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),),
                                        ),),
                                        GestureDetector(onTap: (){
                                          showcredit_cardDetail_offerModal(context,credit_card_detail);
                                        },child:  Container(
                                          width: screenSize.width / 2.8,
                                          height: screenSize.width / 10,
                                          decoration: BoxDecoration(
                                              color: kBackgoundColor5,
                                              borderRadius: BorderRadius.circular(
                                                  screenSize.width / 15)),
                                          child: Center(child: Text("Offer",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),),
                                        ) )

                                      ],
                                    ),

                                  ),
                                  SizedBox(height: screenSize.width / 30,),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: screenSize.width / 8,
                                      right: screenSize.width / 8,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        GestureDetector(onTap: (){
                                          showcredit_cardDetail_peerModal(context,credit_card_detail);
                                        },child: Container(
                                          width: screenSize.width / 2.8,
                                          height: screenSize.width / 10,
                                          decoration: BoxDecoration(
                                              color: kBackgoundColor5,
                                              borderRadius: BorderRadius.circular(
                                                  screenSize.width / 15)),
                                          child: Center(child: Text("Peer",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),),
                                        ),),
                                        GestureDetector(onTap: (){
                                          showcredit_cardDetail_SimulationModal(context,credit_card_detail);
                                        },child:Container(
                                          width: screenSize.width / 2.8,
                                          height: screenSize.width / 10,
                                          decoration: BoxDecoration(
                                              color: kBackgoundColor5,
                                              borderRadius: BorderRadius.circular(
                                                  screenSize.width / 15)),
                                          child: Center(child: Text("Simulation",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),),
                                        ))

                                      ],
                                    ),
                                  ),

                                  SizedBox(height: screenSize.width / 15,),
                                  Container(width: screenSize.width,
                                      padding: EdgeInsets.only(
                                          left: screenSize.width / 10),
                                      child: Text("Requirement", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenSize.width / 25,
                                          color: Colors.white),)),
                                  SizedBox(height: screenSize.width / 40,),
                                  Container(width: screenSize.width,
                                    padding: EdgeInsets.only(
                                        left: screenSize.width / 10, right: screenSize.width / 10),child: Row(children: [
                                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("HKD ${credit_card_detail['min_income']}",style: TextStyle(fontSize:screenSize.width/20,color:kBackgoundColor4),),
                                          Text(
                                            "Minimum Income\nRequirement",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 30,
                                                color: Colors.white),)
                                        ],),
                                      SizedBox(width: screenSize.width/10,),
                                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${credit_card_detail['min_age']}",style: TextStyle(fontSize:screenSize.width/20,color:kBackgoundColor4),),
                                          Text(
                                            "Minimum Age\nRequirement",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 30,
                                                color: Colors.white),)
                                        ],)
                                    ],),),
                                  SizedBox(height: screenSize.width / 10,),
                                  Container(width: screenSize.width,
                                      padding: EdgeInsets.only(
                                          left: screenSize.width / 10),
                                      child: Text("Key feature", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenSize.width / 25,
                                          color: Colors.white),)),

                                  Container(width: screenSize.width,
                                      padding: EdgeInsets.only(
                                          left: screenSize.width / 10, right: screenSize.width / 10),
                                      child: Text(
                                        credit_card_detail['feature'][0],style: TextStyle(
                                          fontSize: screenSize.width / 30,
                                          color: Colors.white),)),

                                  SizedBox(height: screenSize.width / 15,),
                                  Container(width: screenSize.width,
                                    padding: EdgeInsets.only(
                                        left: screenSize.width / 10, right: screenSize.width / 10),child: Row(children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(  credit_card_detail['local_percent'],style: TextStyle(fontSize:screenSize.width/20,color:kBackgoundColor4),),
                                          Text(
                                            "Local Spending\nCashback Rate",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 30,
                                                color: Colors.white),)
                                        ],),
                                      SizedBox(width: screenSize.width/10,),
                                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(credit_card_detail['oversea_percent'],style: TextStyle(fontSize:screenSize.width/20,color:kBackgoundColor4),),
                                          Text(
                                            "Overseas Spendintg\nCashback Rate",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 30,
                                                color: Colors.white),)
                                        ],)
                                    ],),),
                                  Container(margin: EdgeInsets.only(
                                      top:screenSize.width / 20,

                                      bottom: screenSize.width / 20),
                                      width: screenSize.width ,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: screenSize.width/10),
                                          Text(
                                            "Historical Backtest Return",
                                            style: TextStyle(fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: screenSize.width /
                                                    28),),
                                          GestureDetector(onTap: (){
                                            showGeneralDialog(
                                                barrierColor: kBackgoundColor32.withAlpha(220),
                                                transitionBuilder: (context, a1, a2, widget) {
                                                  return Transform.scale(
                                                      scale: a1.value,
                                                      child: Center(child:return_alertBox())
                                                  );
                                                },
                                                transitionDuration: Duration(milliseconds: 200),
                                                barrierDismissible: true,
                                                barrierLabel: '',
                                                context: context,
                                                pageBuilder: (context, animation1, animation2) {
                                                  return return_alertBox();
                                                });
                                          },child:   Container(margin:EdgeInsets.only(left: screenSize.width/35,right: screenSize.width/25),width: screenSize.width/15,height:screenSize.width/15,child:Center(child: Image.asset("assets/quot.png",height: screenSize.width/35,),),decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(screenSize.width/30)),),
                                          ),
                                          //////////////////// Hard Dropdown
                                          Container(
                                            width: screenSize.width / 5,
                                            height: screenSize.width / 12,
                                            decoration: BoxDecoration(
                                              color: kBackgoundColor3,
                                              borderRadius: BorderRadius.circular(
                                                  screenSize.width / 10),
                                            ),
                                            child: FormField<String>(
                                              builder: (FormFieldState<String> state) {
                                                return InputDecorator(
                                                  decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.only(
                                                        left: screenSize.width/30,right: screenSize.width/65,
                                                      ),
                                                      border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 0),
                                                          borderRadius: BorderRadius
                                                              .circular(
                                                              screenSize.width / 10))),
                                                  child: DropdownButtonHideUnderline(
                                                      child: new Theme(
                                                        data: Theme.of(context).copyWith(
                                                          canvasColor: kBackgoundColor3,
                                                        ),
                                                        child: DropdownButton<String>(
                                                          value: pageProvider.period,
                                                          isDense: true,
                                                          onChanged: (newValue) {
                                                            pageProvider.putPeriod(
                                                                newValue);
                                                          },
                                                          icon: Icon( // Add this
                                                            Icons.keyboard_arrow_down,
                                                            size: screenSize.width/15,
                                                            // Add this
                                                            color: Colors
                                                                .white, // Add this
                                                          ),
                                                          selectedItemBuilder: (
                                                              BuildContext context) {
                                                            return periods.map<Widget>((
                                                                String item) {
                                                              return Text(
                                                                item, style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: screenSize
                                                                      .width / 35,
                                                                  fontWeight: FontWeight
                                                                      .bold),);
                                                            }).toList();
                                                          },
                                                          items: periods.map((
                                                              String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                                value: value,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Text(value,
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize: screenSize
                                                                                .width /
                                                                                30,
                                                                            color: Colors
                                                                                .white)),
                                                                    pageProvider.period ==
                                                                        value
                                                                        ? Container(
                                                                      height: screenSize
                                                                          .width / 45,
                                                                      width: screenSize
                                                                          .width / 45,
                                                                      decoration: BoxDecoration(
                                                                          color: kBackgoundColor4,
                                                                          borderRadius: BorderRadius
                                                                              .circular(
                                                                              screenSize
                                                                                  .width /
                                                                                  45)),)
                                                                        : Container()
                                                                  ],)
                                                            );
                                                          }).toList(),
                                                        ),)
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          /////////////////////////
                                        ],
                                      )),

                                  SizedBox(height: screenSize.width / 20,),
                                  /////////////////////////////////////////// Hard Chart
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
                                            rangePadding: ChartRangePadding.round,
                                            interval: 1,
                                            intervalType: DateTimeIntervalType
                                                .auto,
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
                                            minimum: 0,
                                            maximum: pageProvider.final_sum*1.2,
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
                                              markerSettings: MarkerSettings(
                                                  isVisible: true,
                                                  borderWidth: 0,
                                                  width: 0),
                                              borderColor: kBackgoundColor6,
                                              borderWidth: 1.5,
                                              gradient: kLinearGradient1,
                                              dataSource: pageProvider.chartData,
                                              xValueMapper: (SalesData_credit sales,
                                                  _) => sales.year,
                                              yValueMapper: (SalesData_credit sales,
                                                  _) => sales.sales
                                          )
                                        ]
                                    ),),
                                  ///////////////////////////////////////////

                                ],
                              ),);
                          } else if (snapshot.hasError) {
                            return snapshot.error;
                          }
                          return Container(
                          width: screenSize.width,height: screenSize.height,
                            child: Center(child: CircularProgressIndicator(),)
                          );
                        },
                      ),))

                  );
                },
              );
            }
        ));
  }

}