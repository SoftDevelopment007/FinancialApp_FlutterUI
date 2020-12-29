import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetailProvider.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


List<String> periods = [
  "1 WK",
  "1 M",
  "1 YR",
  "2 YR",
  "5 YR",
  "10 YR",
  "ALL"
];


void showtime_depositChartModal(context) {
  var screenSize = MediaQuery
      .of(context)
      .size;
  showCupertinoModalBottomSheet(
      expand: true,
      topRadius: Radius.circular(screenSize.width/10),
      context: context,
      builder: (context) {
        return ChangeNotifierProvider<time_depositDetailProvider>(
            create: (context) => time_depositDetailProvider(),
            child: Builder(
                builder: (context) {
                  return Consumer<time_depositDetailProvider>(
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
                                            Text("Chart",
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
                                                            value: pageProvider.period_selection,
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

                                        Container(margin: EdgeInsets.only(
                                            top:screenSize.width / 20,
                                            left: screenSize.width / 10,
                                            right: screenSize.width / 10,
                                            bottom: screenSize.width / 20),
                                          width: screenSize.width * 0.8,
                                          child: Text(
                                            "Historical return compare with benchmark index\nAction: Can change Period",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: screenSize.width /
                                                    30),),),
                                        /////////////////////////////////////////// Hard Chart

                                        Container(
                                          width: screenSize.width,
                                          height: screenSize.width*0.5,
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
                                                opposedPosition: true,
                                                labelStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                labelFormat: '{value}%',
                                                majorTickLines: MajorTickLines(width: 0),
                                                axisLine: AxisLine(width: 0),
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
                                              LineSeries<SalesData, DateTime>(
                                                  markerSettings: MarkerSettings(
                                                      isVisible: true,
                                                      borderWidth: 0,
                                                      width: 0),
                                                  name: "HSI",
                                                  width: 1.5,
                                                  color: Colors.blueAccent,
                                                  dataSource: pageProvider.chartData_return_HSI,
                                                  xValueMapper: (SalesData sales,
                                                      _) => sales.year,
                                                  yValueMapper: (SalesData sales,
                                                      _) => sales.sales
                                              ),
                                              LineSeries<SalesData, DateTime>(
                                                  markerSettings: MarkerSettings(
                                                      isVisible: true,
                                                      borderWidth: 0,
                                                      width: 0),
                                                  name: "S&P 500",
                                                  width: 1.5,
                                                  color:  Colors.deepOrange,
                                                  dataSource: pageProvider.chartData_return_SP,
                                                  xValueMapper: (SalesData sales,
                                                      _) => sales.year,
                                                  yValueMapper: (SalesData sales,
                                                      _) => sales.sales
                                              )
                                            ],
                                          ),),
                                        ///////////////////////////////////////////
                                        Container(margin: EdgeInsets.only(
                                            top:screenSize.width / 20,
                                            left: screenSize.width / 10,
                                            right: screenSize.width / 10,
                                            bottom: screenSize.width / 20),
                                            width: screenSize.width * 0.8,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "S&P 500 Change to Benchmark index",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: screenSize.width /
                                                          30),),
                                                Container(margin:EdgeInsets.only(left: screenSize.width/30),width: screenSize.width/20,height:screenSize.width/20,child:Center(child: Image.asset("assets/quot.png",height: screenSize.width/35,),),decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(screenSize.width/30)),)
                                              ],
                                            )),
                                        Container(
                                            margin: EdgeInsets.all(screenSize.width/15),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Table(
                                                defaultColumnWidth: FixedColumnWidth(screenSize.width/6),
                                                children: [
                                                  TableRow( children: [
                                                    Column(children:[Text('', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('YTD', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('1M', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('3M', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('5M', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('6M', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('1Y', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('3Y', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('5Y', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),




                                                  ]),
                                                  TableRow( children: [
                                                    Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Price Return', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),

                                                  ]),
                                                  TableRow( children: [
                                                    Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('S&P 500', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),
                                                    Column(children:[Text('-13.75%', style: TextStyle(color:Colors.white,fontSize: screenSize.width/35))]),

                                                  ]),
                                                ],
                                              ),
                                            )
                                        ),
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