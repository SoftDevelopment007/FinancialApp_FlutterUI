import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
import 'package:flutter_app_arexis/credit_cardDetail/return_alert.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_animation_kit/tap_animation_kit.dart';
import 'edit_open.dart';
import 'package:intl/intl.dart';
List<String> periods = [
  "1 WK",
  "1 M",
  "1 YR",
  "2 YR",
  "5 YR",
  "10 YR",
  "ALL"
];


void showcredit_cardDetail_SimulationModal(context,credit_card_detail) {
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
                        Map<String, dynamic> dod=credit_card_detail['dod'];
                        pageProvider.get_totalinvest_put_chartData(credit_card_detail);
                        pageProvider.put_chartData(credit_card_detail);
                        double iget=double.parse(credit_card_detail['cash_APR'].substring(0,credit_card_detail['cash_APR'].length-1));
                        double cash_rate=double.parse(credit_card_detail['exrate'].substring(0,credit_card_detail['exrate'].length-1));
                       double iget_cash=pageProvider.invest*iget/cash_rate;


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
                              child: NotificationListener<OverscrollIndicatorNotification>(
                                  onNotification: (OverscrollIndicatorNotification overscroll) {
                                    overscroll.disallowGlow();
                                    return;
                                  },
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
                                        Container(margin:EdgeInsets.only(top: screenSize.width/20,left: screenSize.width/10,bottom:screenSize.width/30),child: Row(
                                          children: [
                                            Text("Historical Backtest Return",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
                                            GestureDetector(onTap:(){
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
                                            },child:Container(margin:EdgeInsets.only(left: screenSize.width/40),width: screenSize.width/15,height:screenSize.width/15,child:Center(child: Image.asset("assets/quot.png",height: screenSize.width/25,),),decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(screenSize.width/30)),)
                                              ,)
                                              ],
                                        ),),

                                        Container(margin:EdgeInsets.only(left: screenSize.width*0.08,top:screenSize.width/30),
                                          child: Stack(
                                            children: <Widget>[
                                              // Max Size
                                              AnimatedContainer(
                                                duration: Duration(milliseconds: 500),
                                                padding: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/60,top: screenSize.width/35),
                                                margin: EdgeInsets.only(top: screenSize.width*0.18),
                                                decoration: BoxDecoration(borderRadius:BorderRadius.only(bottomLeft:Radius.circular(screenSize.width/20),bottomRight: Radius.circular(screenSize.width/20)),color: kBackgoundColor25),
                                                height: screenSize.width*0.21,
                                                width: screenSize.width*0.84,
                                                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("I get",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: screenSize.width/27),),
                                                    Expanded(child:  TextAnimation(
                                                      animationBahavior: TapAnimatedCrossFade(
                                                        props: CrossFadeModel(
                                                          alignment: Alignment.topCenter,
                                                          crossFadeState: pageProvider.change,
                                                          duration: const Duration(seconds:1 ),
                                                          firstCurve: Curves.easeInCubic,
                                                          firstChild: Container(child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              SizedBox(),
                                                              Text("${iget_cash.toStringAsFixed(0)}",style: TextStyle(color: Colors.white,fontSize: screenSize.width/10),),
                                                              Text("Cash\nDolar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/25,height: 1.2)),
                                                            ],),),
                                                          secondChild: Container(child:
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              SizedBox(),
                                                              Text("${(pageProvider.invest*iget/100).toStringAsFixed(0)}",style: TextStyle(color: Colors.white,fontSize: screenSize.width/10),),
                                                              Text("HKD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/22,height:1.2 )),
                                                            ],),),
                                                          secondCurve: Curves.bounceInOut,
                                                          sizeCurve: Curves.easeOutExpo,
                                                        ),
                                                      ),
                                                    ),),
                                                    GestureDetector(onTap:(){pageProvider.return_change();},child:Column(children: [
                                                      SizedBox(height: screenSize.width/20),
                                                      Icon(Icons.navigate_next,size: screenSize.width/10,color: Colors.white,)
                                                    ],)),

                                                  ],),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),
                                                decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft:Radius.circular(screenSize.width/20),topRight: Radius.circular(screenSize.width/20)),gradient: kLinearGradient3),
                                                height: screenSize.width*0.21,
                                                width: screenSize.width*0.84,
                                                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("I invest",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor18,fontSize: screenSize.width/27),),
                                                    Text(pageProvider.invest.toStringAsFixed(0),style: TextStyle(color: kBackgoundColor18,fontSize: screenSize.width/10),),
                                                    Column(children: [SizedBox(height: screenSize.width/13,),Text("HKD",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor18,fontSize: screenSize.width/22),)],),

                                                  ],),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: screenSize.width*0.07,top: screenSize.width*0.017),
                                                margin: EdgeInsets.only(top:screenSize.width*0.175,left: screenSize.width*0.07),
                                                decoration: BoxDecoration( color: kBackgoundColor26,borderRadius: BorderRadius.circular(screenSize.width*0.08)),
                                                height:screenSize.width*0.08,
                                                width: screenSize.width*0.18,
                                                child: Text("Edit",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: screenSize.width/27),),
                                              ),
                                              GestureDetector(onTap:(){
                                                showGeneralDialog(
                                                    barrierColor: Colors.black.withOpacity(0.5),
                                                    transitionBuilder: (context, a1, a2, widget) {
                                                      return Transform.scale(
                                                          scale: a1.value,
                                                          child: Center(child:edit_open((value){
                                                            return pageProvider.put_edit_value(value);
                                                          }))
                                                      );
                                                    },
                                                    transitionDuration: Duration(milliseconds: 200),
                                                    barrierDismissible: true,
                                                    barrierLabel: '',
                                                    context: context,
                                                    pageBuilder: (context, animation1, animation2) {
                                                      return edit_open((value){
                                                        return pageProvider.put_edit_value(value);
                                                      });
                                                    });
                                              },child: Container(
                                                margin: EdgeInsets.only(top:screenSize.width*0.17,left: screenSize.width*0.04),
                                                decoration: BoxDecoration( color: kBackgoundColor27,borderRadius: BorderRadius.circular(screenSize.width*0.08)),
                                                height:screenSize.width*0.085,
                                                width:screenSize.width*0.085,
                                                child: Image.asset("assets/recycle.png",height: screenSize.width*0.1,width: screenSize.width*0.1,),
                                              ))

                                            ],
                                          )),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(margin:EdgeInsets.only(top: screenSize.width/10,bottom:screenSize.width/40,left: screenSize.width/10),child: Row(
                                              children: [
                                                Text("Saving by category",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
                                              ],
                                            ),),
                                          ],),

                                        Container(width: screenSize.width*0.84,margin: EdgeInsets.only(left: screenSize.width*0.08),padding: EdgeInsets.only(left: screenSize.width*0.02,right: screenSize.width*0.02,top: screenSize.width*0.03,bottom: screenSize.width*0.03),decoration:BoxDecoration(color: kBackgoundColor30,borderRadius: BorderRadius.circular(screenSize.width/30)),
                                          child:Column(crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                            Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(width: screenSize.width*0.33,child: Column(
                                                  children: [
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Dining",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.dinning.toStringAsFixed(0)}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)
                                                    ],),
                                                    SizedBox(height: screenSize.width/60,),
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Home",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.home.toStringAsFixed(0)}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)
                                                    ],),
                                                    SizedBox(height: screenSize.width/60,),
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Financial",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.financial.toStringAsFixed(0)}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)
                                                    ],),
                                                    SizedBox(height: screenSize.width/60,),
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Shopping",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.shopping.toStringAsFixed(0)}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)
                                                    ],),
                                                  ],
                                                )),
                                                Container(height:screenSize.width/5,width: screenSize.width/300,margin: EdgeInsets.only(left: screenSize.width/100,right: screenSize.width/100,top:screenSize.width/20,bottom: screenSize.width/20),decoration: BoxDecoration(color: Colors.grey),),
                                                Container(width: screenSize.width*0.38,child: Column(
                                                  children: [
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Transportation",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.transportation.toStringAsFixed(0)}",maxLines:2,style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)

                                                    ],),
                                                    SizedBox(height: screenSize.width/60,),
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Leisure",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.leisure.toStringAsFixed(0)}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)
                                                    ],),
                                                    SizedBox(height: screenSize.width/60,),
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Healthcare",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.healthcare.toStringAsFixed(0)}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)
                                                    ],),
                                                    SizedBox(height: screenSize.width/60,),
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                      Text("Others",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30),),
                                                      Text("\$${pageProvider.others.toStringAsFixed(0)}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),)
                                                    ],),
                                                  ],
                                                )),
                                              ],
                                            ),

                                            Container(width:screenSize.width/1.3,height: screenSize.width/400,margin: EdgeInsets.only(left: screenSize.width/50,right: screenSize.width/50,bottom: screenSize.width/60),decoration: BoxDecoration(color: Colors.grey),),

                                            Container(width:screenSize.width/1.3,padding:EdgeInsets.only(right: screenSize.width/50),child:
                                            TextAnimation(
                                              animationBahavior: TapAnimatedCrossFade(
                                                props: CrossFadeModel(
                                                  alignment: Alignment.topCenter,
                                                  crossFadeState: pageProvider.change,
                                                  duration: const Duration(seconds:1 ),
                                                  firstCurve: Curves.easeInCubic,
                                                  firstChild: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text("I save",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/25)),
                                                      SizedBox(width: screenSize.width/40,),
                                                      Text("${iget_cash.toStringAsFixed(0)}",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/20)),
                                                      SizedBox(width: screenSize.width/80,),
                                                      Text("cash dollar",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/25))
                                                    ],
                                                  ),
                                                  secondChild: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text("I save",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/25)),
                                                      SizedBox(width: screenSize.width/40,),
                                                      Text("${(pageProvider.invest*iget/100).toStringAsFixed(0)}",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/20)),
                                                      SizedBox(width: screenSize.width/80,),
                                                      Text("dollar",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/25))
                                                    ],
                                                  ),
                                                  secondCurve: Curves.bounceInOut,
                                                  sizeCurve: Curves.easeOutExpo,
                                                ),
                                              ),
                                            )
                                           )

                                          ],)),
                                        Container(margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10,top: screenSize.width/10,bottom: screenSize.width/10),child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Historical Backtest Return",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
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
                                          ],),),
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
                                                      .days,
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
                                    ),
                                  )
                              ))

                          ),
                        ),);
                      }
                  );
                }
            ));
      });
}