
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/chart.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetailProvider.dart';
import 'package:flutter_app_arexis/ETFDetail/peer.dart';
import 'package:flutter_app_arexis/ETFDetail/simulation.dart';
import 'package:flutter_app_arexis/Time_deposit/deposit.dart';
import 'package:flutter_app_arexis/credit_cardDetail/CustomSliderThumbRect.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_comparison.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositChart.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetailProvider.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetail_detail.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositSimulation.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class time_depositDetail extends StatelessWidget {

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
    return ChangeNotifierProvider<time_depositDetailProvider>(
        create: (context) => time_depositDetailProvider(),
        child: Builder(
            builder: (context) {
              return Consumer<time_depositDetailProvider>(
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
                          child: FutureBuilder(
                            future: pageProvider.get_timeDepositdetail(context),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final time_deposit__detail=snapshot.data;
                                final period_days=time_deposit__detail['period_type']=="Weeks"?time_deposit__detail['period']*7:time_deposit__detail['period_type']=="Months"?time_deposit__detail['period']*30:time_deposit__detail['period']*365;
                                final lock_up_position=time_deposit__detail['period_type']=='Year'?time_deposit__detail['period']/(time_deposit__detail['period']+1):time_deposit__detail['period_type']=='Month'?time_deposit__detail['period']/12:time_deposit__detail['period']/48;
                                return Container(
                                  padding: EdgeInsets.only(
                                      bottom: screenSize.width / 10),
                                  decoration: BoxDecoration(color: kBackgoundColor),
                                  child: Column(
                                    children: [
                                      Container(
                                          width: screenSize.width,
                                          margin: EdgeInsets.only(bottom: screenSize.width/30),
                                          padding: EdgeInsets.only(left:screenSize.width/30,right:screenSize.width/30,top:screenSize.width/20,bottom: screenSize.width/30 ),
                                          child:Row(

                                            children: [
                                              SizedBox(width: screenSize.width/15),
                                              Container(
                                                height:screenSize.width/7 ,
                                                width: screenSize.width/7,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenSize.width/14),image: DecorationImage(image:AssetImage("assets/bank.png"),fit: BoxFit.fill )),

                                              ),
                                              SizedBox(width: screenSize.width/40),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: screenSize.width/2.5,
                                                    child:Text(time_deposit__detail['bank_name'], overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
                                                  ),
                                                  Container(
                                                    width: screenSize.width/1.5,
                                                    child:Text(time_deposit__detail['product_name'], overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/27,color:Colors.white),),
                                                  ),
                                                  SizedBox(height: screenSize.width/72),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(width: screenSize.width/3.5,child:  Column(
                                                        children: [
                                                          Text("${time_deposit__detail['rate']*100}%",style: TextStyle(fontSize: screenSize.width/17,color: kBackgoundColor4),),
                                                          Text("Annual interest rate",style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)
                                                        ],
                                                      ), ),

                                                      Container(width: screenSize.width/7,child:  Column(
                                                        children: [
                                                          SizedBox(height: screenSize.width/100,),
                                                          Text(time_deposit__detail['period'].toString(),style: TextStyle(fontSize: screenSize.width/20,color: kBackgoundColor4),),
                                                          Text(time_deposit__detail['period_type'].toString(),style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                                                        ],
                                                      ), ),

                                                      Container(width: screenSize.width/4,child:  Column(
                                                        children: [
                                                          SizedBox(height: screenSize.width/100,),
                                                          Text(time_deposit__detail['deposit_min'].toString(),style: TextStyle(fontSize: screenSize.width/20,color: kBackgoundColor4),),
                                                          Text("Minimum deposit",style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                                                        ],
                                                      ),)

                                                    ],
                                                  )

                                                ],
                                              )
                                            ],
                                          )
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: screenSize.width / 8,
                                            right: screenSize.width / 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            GestureDetector(onTap: (
                                                ) {showtimedepositDetail_detaillModal(context,time_deposit__detail);
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
                                              showtime_depositChartModal(context);
                                            },child:  Container(
                                              width: screenSize.width / 2.8,
                                              height: screenSize.width / 10,
                                              decoration: BoxDecoration(
                                                  color: kBackgoundColor5,
                                                  borderRadius: BorderRadius.circular(
                                                      screenSize.width / 15)),
                                              child: Center(child: Text("Chart",
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
                                              showtime_depositComparisonModal(context,time_deposit__detail);
                                            },child: Container(
                                              width: screenSize.width / 2.8,
                                              height: screenSize.width / 10,
                                              decoration: BoxDecoration(
                                                  color: kBackgoundColor5,
                                                  borderRadius: BorderRadius.circular(
                                                      screenSize.width / 15)),
                                              child: Center(child: Text("Comparison",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 22,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),),),
                                            ),),
                                            GestureDetector(onTap: (){
                                              showdepositSimulationModal(context,time_deposit__detail);
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

                                      Container(margin:EdgeInsets.only(top:screenSize.width/10,left: screenSize.width/15),child:
                                      Stack(children: [
                                        Row( mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                          Container(margin: EdgeInsets.only(left: screenSize.width/20),child:  Column(
                                            children: [
                                              Text("Minimum deposit",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/32),),
                                              Row(
                                                children: [
                                                  Column(children: [
                                                    SizedBox(height: screenSize.width/50),
                                                    Text("HKD ",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/32),),
                                                  ],),
                                                  Text((pageProvider.deposit+time_deposit__detail['deposit_min']).toStringAsFixed(0),style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/13),),
                                                ],)

                                            ],
                                          ),),
                                            Container(margin: EdgeInsets.only(right: screenSize.width/30),child:Column(
                                              children: [
                                                Text("Expected return",style: TextStyle(color: Colors.white,fontSize: screenSize.width/32),),
                                                Text(((pageProvider.deposit+time_deposit__detail['deposit_min'])*time_deposit__detail['rate']*period_days/365).toStringAsFixed(0),style: TextStyle(color: Colors.white,fontSize: screenSize.width/13),),
                                              ],
                                            )
                                            )
                                        ],),
                                        Container(width:screenSize.width*0.87,margin:EdgeInsets.only(top: screenSize.width/10),child:FlutterSlider(
                                            values: [pageProvider.deposit+time_deposit__detail['deposit_min'].toDouble()],
                                            max: time_deposit__detail['deposit_max']=='inf'?time_deposit__detail['deposit_min']*10.toDouble():double.parse(time_deposit__detail['deposit_max']),
                                            min: time_deposit__detail['deposit_min'].toDouble(),
                                            tooltip: FlutterSliderTooltip(disabled: true),
                                            onDragging: (handlerIndex, lowerValue, upperValue) {
                                              pageProvider.deposit_change(lowerValue-time_deposit__detail['deposit_min'].toDouble());
                                            },
                                            trackBar: FlutterSliderTrackBar(
                                              activeTrackBarHeight: screenSize.width/70,
                                              inactiveTrackBarHeight: screenSize.width/70,
                                              inactiveTrackBar: BoxDecoration(
                                                borderRadius: BorderRadius.circular(screenSize.width/30),
                                                color: kBackgoundColor32,

                                              ),

                                              activeTrackBar: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(screenSize.width/30),
                                                  color: kBackgoundColor33
                                              ),
                                            ),
                                            handler: FlutterSliderHandler(
                                                decoration: BoxDecoration(),
                                                child:Container(height: screenSize.width/30,width: screenSize.width/15,decoration: BoxDecoration(color: kBackgoundColor33,borderRadius: BorderRadius.circular(screenSize.width/20)),))
                                        ), ),

                                        Container(margin:EdgeInsets.only(left: screenSize.width/1.8,top: screenSize.width/4.8),child:  Column(
                                          children: [
                                            Image.asset("assets/up.png",height: screenSize.width/40,fit: BoxFit.fill,),
                                            GestureDetector(onTap:(){
                                              pageProvider.deposit_change(time_deposit__detail['deposit_max']=='inf'?(time_deposit__detail['deposit_min']*10.toDouble()-time_deposit__detail['deposit_min'].toDouble()):(double.parse(time_deposit__detail['deposit_max'])-time_deposit__detail['deposit_min'].toDouble()));
                                            },child:Text("Optimized deposit",textAlign:TextAlign.center,style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),), )


                                          ],
                                        ))
                                      ],),),
                                      Stack(
                                        children: [
                                          Container(margin:EdgeInsets.only(left: screenSize.width/10),child:   Row(children: [ SizedBox(width: screenSize.width/30,),Container(width:screenSize.width/3,child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text("lock-up period",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/25),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(time_deposit__detail['lockup'].toString(),style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/25),),
                                                      SizedBox(width: 5),
                                                      Text(time_deposit__detail['period_type'],style: TextStyle(color: Colors.white,fontSize: screenSize.width/25,),)
                                                    ],)

                                                ],
                                              ),
                                            ],
                                          ),)],),),
                                          Container(margin:EdgeInsets.only(left: screenSize.width/15,right: screenSize.width/15,top:screenSize.width/10),height:screenSize.width/10,child: FlutterSlider(
                                              values: [lock_up_position*100],
                                              max: 100,
                                              min: 0,
                                              tooltip: FlutterSliderTooltip(disabled: true),
                                              onDragging: (handlerIndex, lowerValue, upperValue) {
                                                pageProvider.period_change(lowerValue);
                                              },
                                              trackBar: FlutterSliderTrackBar(
                                                activeTrackBarHeight: screenSize.width/70,
                                                inactiveTrackBarHeight: screenSize.width/70,
                                                inactiveTrackBar: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(screenSize.width/30),
                                                  color: Colors.white54,
                                                ),

                                                activeTrackBar: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(screenSize.width/30),
                                                    color: kBackgoundColor33
                                                ),
                                              ),
                                              handler: FlutterSliderHandler(
                                                  disabled: true,
                                                  decoration: BoxDecoration(),
                                                  child:Column(children: [
                                                    Icon(Icons.lock_outline, size: screenSize.width/15,color: kBackgoundColor33,),
                                                    SizedBox(height: screenSize.width/100,)
                                                  ],))
                                          ) ,),
                                          Container(margin:EdgeInsets.only(left: screenSize.width/10,top: screenSize.width/9),child: Column(
                                            children: [
                                              Image.asset("assets/polygon.png",height: screenSize.width/20,),
                                              SizedBox(height: screenSize.width/200,),
                                              Text("Today",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/40,color: kBackgoundColor33),)
                                            ],
                                          ),),
                                          Container(margin:EdgeInsets.only(left: screenSize.width/1.3,top: screenSize.width/6),child: Text(time_deposit__detail['period_type']=='Year'?DateFormat('MMMM yyyy').format(DateTime(DateTime.now().year+time_deposit__detail['period'].toInt()+1,DateTime.now().month,DateTime.now().day)).toString():DateFormat('MMMM yyyy').format(DateTime(DateTime.now().year+1,DateTime.now().month,DateTime.now().day)).toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/40,color: kBackgoundColor33),))
                                        ],
                                      ),
                                      SizedBox(height: screenSize.width/10,),
                                      Row(children: [ SizedBox(width: screenSize.width/10,),Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/20),)],),
                                      Row(children: [ SizedBox(width: screenSize.width/10,),
                                        Container(width: screenSize.width/1.3,child: Text(time_deposit__detail['description'],style: TextStyle(color: Colors.white,fontSize: screenSize.width/32),))],),




                                    ],
                                  ),) ;
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