import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/addtochart.dart';
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


void showSimulationModal(context) {
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
                                          ],),),
                                        Container(margin:EdgeInsets.only(top: screenSize.width/20,left: screenSize.width/10),child: Row(
                                          children: [
                                            Text("Return Simulator",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
                                            Container(margin:EdgeInsets.only(left: screenSize.width/40),width: screenSize.width/20,height:screenSize.width/20,child:Center(child: Image.asset("assets/quot.png",height: screenSize.width/35,),),decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(screenSize.width/30)),)
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
                                                                Text("10",style: TextStyle(color: Colors.white,fontSize: screenSize.width/10),),
                                                                Text("Cash\nDolar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/25,height: 1.2)),
                                                              ],),),
                                                            secondChild: Container(child:
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                SizedBox(),
                                                                Text("≈ 1",style: TextStyle(color: Colors.white,fontSize: screenSize.width/10),),
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
                                                      Text("9000",style: TextStyle(color: kBackgoundColor18,fontSize: screenSize.width/10),),
                                                      Column(children: [SizedBox(height: screenSize.width/13,),Text("HKD",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor18,fontSize: screenSize.width/22),)],),

                                                    ],),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(left: screenSize.width*0.07,top: screenSize.width*0.017),
                                                  margin: EdgeInsets.only(top:screenSize.width*0.175,left: screenSize.width*0.1),
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
                                                            child: Center(child:etf_edit_open(context))
                                                        );
                                                      },
                                                      transitionDuration: Duration(milliseconds: 200),
                                                      barrierDismissible: true,
                                                      barrierLabel: '',
                                                      context: context,
                                                      pageBuilder: (context, animation1, animation2) {
                                                        return etf_edit_open(context);
                                                      });
                                                },child: Container(
                                                  margin: EdgeInsets.only(top:screenSize.width*0.17,left: screenSize.width*0.07),
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
                                          Container(margin:EdgeInsets.only(top: screenSize.width/10,bottom:screenSize.width/10,left: screenSize.width/10),child: Row(
                                            children: [
                                              Text("Simulated Return",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),

                                            ],
                                          ),),
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
                                                AreaSeries<SalesData, DateTime>(
                                                    markerSettings: MarkerSettings(
                                                        isVisible: true,
                                                        borderWidth: 0,
                                                        width: 0),
                                                    borderColor: kBackgoundColor6,
                                                    borderWidth: 1.5,
                                                    gradient: kLinearGradient4,
                                                    dataSource: pageProvider.chartData_return_HSI,
                                                    xValueMapper: (SalesData sales,
                                                        _) => sales.year,
                                                    yValueMapper: (SalesData sales,
                                                        _) => sales.sales
                                                )
                                              ]
                                          ),),
                                        ///////////////////////////////////////////
                                        Container(margin:EdgeInsets.only(top: screenSize.width/5,bottom:screenSize.width/10,left: screenSize.width/10),child: Row(
                                          children: [
                                            Text("Return Comparison",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
                                          ],
                                        ),),

                                        Container(margin: EdgeInsets.only(left: screenSize.width/5,right: screenSize.width/10),
                                          child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(left: screenSize.width/50),
                                              height: screenSize.width/15,width: screenSize.width/7,
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(screenSize.width/20),color: pageProvider.addhsi==1?Colors.white24:Colors.transparent),
                                              child: Row(children: [ Container(margin:EdgeInsets.only(right: screenSize.width/40),height: screenSize.width/100,width: screenSize.width/30,decoration: BoxDecoration(color: Colors.pinkAccent),),
                                                Text("HSI",style: TextStyle(color: Colors.white,fontSize: screenSize.width/35),)
                                              ],),
                                            ),
                                            SizedBox(width: screenSize.width/20,),
                                            Container(
                                              padding: EdgeInsets.only(left: screenSize.width/60),
                                              height: screenSize.width/15,width: screenSize.width/5,
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(screenSize.width/20),color: pageProvider.addhs==2?Colors.white24:Colors.transparent),
                                              child: Row(children: [ Container(margin:EdgeInsets.only(right: screenSize.width/40),height: screenSize.width/100,width: screenSize.width/30,decoration: BoxDecoration(color: Colors.blueAccent),),
                                                Text("S&P 500",style: TextStyle(color: Colors.white,fontSize: screenSize.width/35),)
                                              ],),
                                            ),
                                            SizedBox(width:screenSize.width*0.2 ),
                                            GestureDetector(onTap: (){
                                              showCupertinoModalBottomSheet(
                                                  backgroundColor: Colors.transparent,
                                                  topRadius: Radius.circular(screenSize.width / 10),
                                                  context: context,
                                                  builder: (context) {
                                                    return addtochart((value){
                                                       return pageProvider.putchart(value);
                                                    });
                                                  });
                                            },child:Image.asset("assets/icon1.png",height: screenSize.width/20,) )

                                          ],
                                        ),),
                                        Container(margin: EdgeInsets.only(left: screenSize.width/15,bottom: screenSize.width/40,),child: Text("HKD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/30),),),

                                        /////////////////////////////////////////// Hard Chart

                                        Container(
                                            width: screenSize.width,
                                            height: screenSize.width*0.6,
                                            margin: EdgeInsets.only(
                                            left: screenSize.width / 20,
                                            right: screenSize.width / 30),
                                          child: SfCartesianChart(

                                            tooltipBehavior: TooltipBehavior(
                                              enable: true,
                                              color: Colors.grey.withAlpha(100),
                                              textAlignment: ChartAlignment.near
                                            ),
                                            trackballBehavior: TrackballBehavior(
                                                enable: true,
                                                shouldAlwaysShow: true,
                                                tooltipAlignment: ChartAlignment.far,
                                                tooltipDisplayMode: TrackballDisplayMode
                                                    .groupAllPoints,
                                                markerSettings: TrackballMarkerSettings(
                                                    markerVisibility: TrackballVisibilityMode
                                                        .auto,
                                                    width: 6,
                                                    height: 6,
                                                    borderColor: Colors.blue,
                                                    color: Colors.tealAccent,
                                                    borderWidth: 5),
                                                lineType: TrackballLineType.vertical,
                                                lineColor: Colors.white60,
                                                lineWidth: 1,
                                                activationMode: ActivationMode
                                                    .singleTap,
                                                tooltipSettings:
                                                InteractiveTooltip(
                                                    enable: false,
                                                    format: 'point.y',
                                                    borderWidth: 3,
                                                    borderColor: Colors.transparent,
                                                    color: Colors.white38,
                                                    textStyle: ChartTextStyle(
                                                        color: Colors.white,
                                                        fontSize: screenSize.width /30,
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
                                              pageProvider.addhsi==1?LineSeries<SalesData, DateTime>(
                                                  enableTooltip: true,
                                                  markerSettings: MarkerSettings(
                                                      isVisible: true,
                                                      borderWidth: 0,
                                                      width: 0),
                                                  name: "HSI",
                                                  width: 1.5,
                                                  color: Colors.pinkAccent,
                                                  dataSource: pageProvider.chartData_return_HSI,
                                                  xValueMapper: (SalesData sales,
                                                      _) => sales.year,
                                                  yValueMapper: (SalesData sales,
                                                      _) => sales.sales
                                              ):LineSeries(),
                                              pageProvider.addhs==2?LineSeries<SalesData, DateTime>(
                                                isVisible: pageProvider.addhs==2?true:false,
                                                 enableTooltip: true,
                                                  markerSettings: MarkerSettings(
                                                      isVisible: true,
                                                      borderWidth: 0,
                                                      width: 0),
                                                  name: "S&P 500",
                                                  width: 1.5,
                                                  color:  Colors.blueAccent,
                                                  dataSource: pageProvider.chartData_return_SP,
                                                  xValueMapper: (SalesData sales,
                                                      _) => sales.year,
                                                  yValueMapper: (SalesData sales,
                                                      _) => sales.sales
                                              ):LineSeries()
                                            ],
                                          ),),
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