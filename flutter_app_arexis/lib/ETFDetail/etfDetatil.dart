import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/chart.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetailProvider.dart';
import 'package:flutter_app_arexis/ETFDetail/peer.dart';
import 'package:flutter_app_arexis/ETFDetail/simulation.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'detail.dart';

class etfDetail extends StatelessWidget {

  List<String> periods = [
    "1 WK",
    "1 M",
    "3 M",
    "6 M",
    "1 YR",
    "3 YR",
    "5 YR",
    "10 YR",
    "All"
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return ChangeNotifierProvider<etfDetailProvider>(
        create: (context) => etfDetailProvider(),
        child: Builder(
            builder: (context) {
              return Consumer<etfDetailProvider>(
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
                            future: pageProvider.get_etfdetail(context),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final etf_detail=snapshot.data;
                                pageProvider.put_chartData(etf_detail);
                                print("${ screenSize.width * (0.8 *
                                    (pageProvider.todayPrice -
                                        pageProvider.low) /
                                    (pageProvider.high -
                                        pageProvider.low))+1}");
                                return Container(
                                  padding: EdgeInsets.only(
                                      bottom: screenSize.width / 10),
                                  decoration: BoxDecoration(color: kBackgoundColor),
                                  child: Column(
                                    children: [
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                            left: screenSize.width / 10,),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .end,
                                            children: [
                                          Container(padding: EdgeInsets.only(
                                          bottom: screenSize.width / 100),
                                           width: screenSize.width / 2.5,
                                             child:
                                                  Text(etf_detail['etf_code'], style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenSize.width / 13,
                                                  color: Colors.white),),),
                                              SizedBox(width: screenSize.width / 30,),
                                              Container(padding: EdgeInsets.only(
                                                  bottom: screenSize.width / 100),
                                                width: screenSize.width / 2.5,
                                                child: Text(etf_detail['etf_name'],overflow: TextOverflow.ellipsis,maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 25,
                                                      color: Colors.white),),)

                                            ],
                                          )
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: screenSize.width / 20),
                                        padding: EdgeInsets.only(
                                          left: screenSize.width / 10,
                                          right: screenSize.width / 10,),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Container(width: screenSize.width / 2.8,
                                              child: Text("\$${etf_detail['etf_price']}",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 12,
                                                    color: kBackgoundColor4),),
                                            ),
                                            Column(
                                              children: [
                                                Row( mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Image.asset("assets/arrow.png",height: screenSize.width/50,),
                                                    SizedBox(width: screenSize.width/90,),
                                                    Text("${etf_detail['etf_price_change']}(${etf_detail['etf_price_change']}%)",overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/30,color: Colors.red),)
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: screenSize.width / 90),
                                                Container(width: screenSize.width / 3,
                                                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                                                      Text(etf_detail['etf_last_updated']??'',style: TextStyle(color: Colors.grey,fontSize: screenSize.width/40),)
                                                    ],))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: screenSize.width / 8,
                                            right: screenSize.width / 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            GestureDetector(onTap: () {
                                              showDetailModal(context,etf_detail);
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
                                              showChartModal(context);
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
                                              showPeerModal(context);
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
                                              showSimulationModal(context);
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
                                      /////////////////////////////////////// Price Range Bar
                                      SizedBox(height: screenSize.width / 30,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10),
                                          child: Text("52wk Price Range",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 25,
                                                color: Colors.white),)),
                                      SizedBox(height: screenSize.width / 60,),
                                      Container(padding: EdgeInsets.only(
                                          left: screenSize.width * (0.77 * (pageProvider.todayPrice - pageProvider.low) / (pageProvider.high -  pageProvider.low))),
                                        width: screenSize.width,
                                        child: Text(
                                          "${pageProvider.todayPrice} Today",overflow: TextOverflow.ellipsis,maxLines: 2,
                                          style: TextStyle(
                                              fontSize: screenSize.width / 30,
                                              color: kBackgoundColor4),),),
                                      Container(margin: EdgeInsets.only(
                                          left: screenSize.width / 10,
                                          right: screenSize.width / 10), child: Row(
                                        children: [
                                          Container(height: screenSize.width / 50,
                                            width: screenSize.width / 120,
                                            decoration: BoxDecoration(
                                                color: kBackgoundColor4),),
                                          SizedBox(width: screenSize.width * (0.77 *
                                              (pageProvider.todayPrice -
                                                  pageProvider.low) /
                                              (pageProvider.high -
                                                  pageProvider.low))),
                                          Container(child: Image.asset(
                                            "assets/polygon.png",
                                            height: screenSize.width / 50,
                                            width: screenSize.width / 100,)),
                                          new Spacer(),
                                          Container(height: screenSize.width / 50,
                                            width: screenSize.width / 120,
                                            decoration: BoxDecoration(
                                                color: kBackgoundColor4),)
                                        ],
                                      ),),
                                      Container(margin: EdgeInsets.only(
                                          left: screenSize.width / 10,
                                          right: screenSize.width / 10),
                                        height: screenSize.width / 200,
                                        width: screenSize.width,
                                        color: kBackgoundColor4,),
                                      SizedBox(height: screenSize.width / 60,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text(
                                                "Low ${pageProvider.low}",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: kBackgoundColor4),),),
                                              Container(child: Text(
                                                "High ${pageProvider.high}",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: kBackgoundColor4),),),
                                            ],
                                          )),
                                      /////////////////////////////////////////
                                      SizedBox(height: screenSize.width / 30,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text(
                                                "Size(Market Cap)", style: TextStyle(
                                                  fontSize: screenSize.width / 30,
                                                  color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_market_cap'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Assets(AUM)",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_asset'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),

                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Volume",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_volume'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Expense Ratio",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_exp_ratio'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),

                                      SizedBox(height: screenSize.width / 15,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10),
                                          child: Text("Dividends", style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenSize.width / 25,
                                              color: Colors.white),)),
                                      SizedBox(height: screenSize.width / 40,),

                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Rate",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_div_rate'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text(
                                                "Annualised yield", style: TextStyle(
                                                  fontSize: screenSize.width / 30,
                                                  color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_yield_ttm'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Ex-divided date",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_div_ex_date'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),

                                      SizedBox(height: screenSize.width / 15,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10),
                                          child: Text("Overview", style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenSize.width / 25,
                                              color: Colors.white),)),
                                      SizedBox(height: screenSize.width / 40,),
                                      Row(children: [
                                        //////////////////// Hard Dropdown
                                        Container(
                                          margin: EdgeInsets.only(left: screenSize.width/10),
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
                                                        left: screenSize.width/30,right: screenSize.width/65
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
                                      ],),
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
                                                opposedPosition: true,
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
                                              AreaSeries<SalesData, DateTime>(
                                                  markerSettings: MarkerSettings(
                                                      isVisible: true,
                                                      borderWidth: 0,
                                                      width: 0),
                                                  borderColor: kBackgoundColor6,
                                                  borderWidth: 1.5,
                                                  gradient: kLinearGradient1,
                                                  dataSource: pageProvider.chartData,
                                                  xValueMapper: (SalesData sales,
                                                      _) => sales.year,
                                                  yValueMapper: (SalesData sales,
                                                      _) => sales.sales
                                              )
                                            ]
                                        ),),
                                      ///////////////////////////////////////////
                                      SizedBox(height: screenSize.width / 40,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text(
                                                "Morningstar rating",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['ms_rating'].toString(),
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Primary exchange",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_exchange'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Category",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['etf_category'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Geo-Focus",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['geo_focus'],
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Index",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(width:screenSize.width/2,child: Text(etf_detail['underlying_index'],overflow: TextOverflow.ellipsis,maxLines: 3,
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            children: [
                                              Container(margin: EdgeInsets.only(
                                                  right: screenSize.width / 30),
                                                child: Text("Risk", style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              pageProvider.risk > 4
                                                  ? Container(child: Text("High",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.orange),),)
                                                  : pageProvider.risk == 4
                                                  ? Container(child: Text(
                                                "Above Average", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenSize.width / 30,
                                                  color: Colors.orange),),)
                                                  : pageProvider.risk == 3
                                                  ? Container(child: Text("Average",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.orange),),)
                                                  : pageProvider.risk == 2
                                                  ? Container(child: Text(
                                                "Below Average", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenSize.width / 30,
                                                  color: Colors.orange),),)
                                                  : Container(child: Text("Low",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.orange),),)
                                            ],
                                          )),
                                      Container(margin: EdgeInsets.only(
                                          left: screenSize.width / 12,
                                          right: screenSize.width / 12,
                                          bottom: screenSize.width / 60),
                                        child: StepProgressIndicator(
                                          totalSteps: 5,
                                          currentStep: pageProvider.risk,
                                          size: screenSize.width / 20,
                                          roundedEdges: Radius.circular(
                                              screenSize.width / 80),
                                          padding: screenSize.width / 100,

                                          customStep: (index, color, _) =>
                                          index < pageProvider.risk
                                              ? Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  riskColor[index],
                                                  riskColor[index + 1]
                                                ],
                                              ),
                                            ),
                                          ) : Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: screenSize.width / 200,
                                                    color: kBackgoundColor12)),
                                          ),
                                        ),),

                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            children: [
                                              Container(margin: EdgeInsets.only(
                                                  right: screenSize.width / 30),
                                                child: Text("Return",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: Colors.white),),),
                                              pageProvider.etf_return > 4
                                                  ? Container(child: Text("High",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.orange),),)
                                                  : pageProvider.etf_return == 4
                                                  ? Container(child: Text(
                                                "Above Average", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenSize.width / 30,
                                                  color: Colors.orange),),)
                                                  : pageProvider.etf_return == 3
                                                  ? Container(child: Text("Average",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 30,
                                                    color: kBackgoundColor17),),)
                                                  : pageProvider.etf_return == 2
                                                  ? Container(child: Text(
                                                "Below Average", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenSize.width / 30,
                                                  color: Colors.orange),),)
                                                  : Container(child: Text("Low",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.orange),),)
                                            ],
                                          )),
                                      Container(margin: EdgeInsets.only(
                                          left: screenSize.width / 12,
                                          right: screenSize.width / 12,
                                          bottom: screenSize.width / 60),
                                        child: StepProgressIndicator(
                                          totalSteps: 5,
                                          currentStep: pageProvider.etf_return,
                                          size: screenSize.width / 20,
                                          roundedEdges: Radius.circular(
                                              screenSize.width / 80),
                                          padding: screenSize.width / 100,

                                          customStep: (index, color, _) =>
                                          index < pageProvider.etf_return
                                              ? Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  returnColor[index],
                                                  returnColor[index + 1]
                                                ],
                                              ),
                                            ),
                                          ) : Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: screenSize.width / 200,
                                                    color: kBackgoundColor12)),
                                          ),
                                        ),),


                                      SizedBox(height: screenSize.width / 15,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10),
                                          child: Text("Risk Measure",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenSize.width / 25,
                                                color: Colors.white),)),
                                      SizedBox(height: screenSize.width / 40,),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text(
                                                "Standard Deviation",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['standard_deviation'].toString(),
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text(
                                                "Sharpe Ratio",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(etf_detail['sharpe_ratio'].toString(),
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Beta",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(pageProvider.period_day<366?etf_detail['beta']['1yr'].toString():pageProvider.period_day<1096?etf_detail['beta']['3yr'].toString():etf_detail['beta']['5yr'].toString(),
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),
                                      Container(width: screenSize.width,
                                          padding: EdgeInsets.only(
                                              left: screenSize.width / 10,
                                              right: screenSize.width / 10,
                                              bottom: screenSize.width / 60),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Container(child: Text("Alpha",
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                              Container(child: Text(pageProvider.period_day<366?etf_detail['alpha']['1yr'].toString():pageProvider.period_day<1096?etf_detail['alpha']['3yr'].toString():etf_detail['alpha']['5yr'].toString(),
                                                style: TextStyle(
                                                    fontSize: screenSize.width / 30,
                                                    color: Colors.white),),),
                                            ],
                                          )),


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
                          ),

                          ))
                  );
                },
              );
            }
        ));
  }

}