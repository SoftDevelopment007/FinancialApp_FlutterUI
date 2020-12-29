import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetail.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetailProvider.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
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

void showtime_depositComparisonModal(context,time_depositDetail) {
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
                        final comparisons=time_depositDetail['peer'];
                         final comparisons_widgets=<Widget>[];
                          for(int i=0;i<comparisons.length;i++){
                            comparisons_widgets.add(
                            GestureDetector(onTap:(){
                              pageProvider.change_peer_open(i);
                            }, child:   AnimatedContainer(duration: const Duration(milliseconds: 250),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(screenSize.width/15),
                                    color:kBackgoundColor8
                                ),
                                alignment: Alignment.centerLeft,
                                margin:EdgeInsets.only(top:screenSize.width/30,  left: screenSize.width / 30,
                                    right:screenSize.width / 30,bottom: screenSize.width/30),
                                padding: EdgeInsets.only(
                                  top: screenSize.width/30,
                                  bottom: screenSize.width/30,
                                  left: screenSize.width / 20,
                                  right:screenSize.width / 20, ),
                                child:Column(
                                  children: [

                                    Row(

                                      children: [
                                        Column(children: [
                                          Container(
                                            height:screenSize.width/6 ,
                                            width: screenSize.width/6,
                                            decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(screenSize.width/12),),

                                          ),
                                        ],),
                                        SizedBox(width: screenSize.width/50),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: screenSize.width/2.5,
                                              child:Text(comparisons[i]['bank_name'], overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
                                            ),
                                            Container(
                                              width: screenSize.width/1.7,
                                              child:Text(comparisons[i]['product_name'], overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/22,color:Colors.white),),
                                            ),
                                            SizedBox(height: screenSize.width/72),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(width: screenSize.width/3.5,child:  Column(
                                                  children: [
                                                    Text("${comparisons[i]['rate']}%",style: TextStyle(fontSize: screenSize.width/17,color: kBackgoundColor4),),
                                                    Text("Annual interest rate",style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)
                                                  ],
                                                ), ),

                                                Container(width: screenSize.width/10,child:  Column(
                                                  children: [
                                                    SizedBox(height: screenSize.width/100,),
                                                    Text(comparisons[i]['period'].toString(),style: TextStyle(fontSize: screenSize.width/20,color: kBackgoundColor4),),
                                                    Text(comparisons[i]['period_type'].toString(),style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                                                  ],
                                                ), ),

                                                Container(width: screenSize.width/4,child:  Column(
                                                  children: [
                                                    SizedBox(height: screenSize.width/100,),
                                                    Text(comparisons[i]['deposit_min'].toString(),style: TextStyle(fontSize: screenSize.width/20,color: kBackgoundColor4),),
                                                    Text("Minimum deposit",style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                                                  ],
                                                ),)

                                              ],
                                            )

                                          ],
                                        )
                                      ],
                                    ),
                                    pageProvider.peer_open[i]?Container(width: screenSize.width,
                                        padding: EdgeInsets.only(
                                            top:screenSize.width/30,

                                            bottom: screenSize.width / 60),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Container(margin:EdgeInsets.only(top:screenSize.width/10),child:
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
                                                            Text("HKD",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/32),),
                                                          ],),
                                                          Text((pageProvider.deposit+comparisons[i]['deposit_min']).toString(),style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/13),),
                                                        ],)

                                                    ],
                                                  ),),
                                                  Container(margin: EdgeInsets.only(right: screenSize.width/30),child:Column(
                                                    children: [
                                                      Text("Expected return",style: TextStyle(color: Colors.white,fontSize: screenSize.width/32),),
                                                      Text((comparisons[i]['predicted_return_per10k']*(pageProvider.deposit+comparisons[i]['deposit_min'])/10000).toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: screenSize.width/13),),
                                                    ],
                                                  )
                                                  )
                                                ],),
                                              Container(width:screenSize.width*0.87,margin:EdgeInsets.only(top: screenSize.width/10),child:FlutterSlider(
                                                  values: [pageProvider.deposit+comparisons[i]['deposit_min'].toDouble()],
                                                  max: comparisons[i]['deposit_max']=='inf'?comparisons[i]['deposit_min'].toDouble()*2:double.parse(comparisons[i]['deposit_max']),
                                                  min: comparisons[i]['deposit_min'].toDouble(),
                                                  tooltip: FlutterSliderTooltip(disabled: true),
                                                  onDragging: (handlerIndex, lowerValue, upperValue) {
                                                    pageProvider.deposit_change(lowerValue-comparisons[i]['deposit_min'].toDouble());
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

                                              Container(margin:EdgeInsets.only(left: screenSize.width/2,top: screenSize.width/4.8),child:  Column(
                                                children: [
                                                  Image.asset("assets/up.png",height: screenSize.width/40,fit: BoxFit.fill,),
                                                  Text("Optimized deposit",textAlign:TextAlign.center,style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),),

                                                ],
                                              ))
                                            ],),),
                                            Stack(
                                              children: [
                                                Container(child:   Row(children: [ SizedBox(width: screenSize.width/30,),Container(width:screenSize.width/3,child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("lock-up period",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/25),),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(comparisons[i]['lockup'].toString(),style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/25),),
                                                            Text(" months",style: TextStyle(color: Colors.white,fontSize: screenSize.width/25,),)
                                                          ],)

                                                      ],
                                                    ),
                                                  ],
                                                ),)],),),
                                                Container(margin:EdgeInsets.only(top:screenSize.width/10),height:screenSize.width/10,child: FlutterSlider(
                                                    values: [200],
                                                    max: 500,
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
                                                Container(margin:EdgeInsets.only(left: screenSize.width/1.55,top: screenSize.width/6),child: Text("Jan 2020",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/40,color: kBackgoundColor33),))
                                              ],
                                            ),
                                            SizedBox(height: screenSize.width/10,),
                                            Row(children: [Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/20),)],),
                                            Row(children: [
                                              Container(width: screenSize.width/1.3,child: Text(comparisons[i]['description'],style: TextStyle(color: Colors.white,fontSize: screenSize.width/32),))],),
                                            Row(children: [  Container(
                                                margin: EdgeInsets.only(top:screenSize.width/15,bottom: screenSize.width/15,left: screenSize.width/30),
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Table(
                                                    defaultColumnWidth: FixedColumnWidth(screenSize.width/4),
                                                    children: [
                                                      TableRow(
                                                          children: [
                                                            Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('定期存款期', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),
                                                            Column(children:[Text('3 個月', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),
                                                            Column(children:[Text('6 個月', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),

                                                          ]),
                                                      TableRow(
                                                          children: [
                                                            Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/60))]),
                                                            Column(children:[Text('', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/60))]),
                                                            Column(children:[Text('', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/60))]),

                                                          ]),
                                                      TableRow( children: [
                                                        Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('港元', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),
                                                        Column(mainAxisAlignment:MainAxisAlignment.center,children:[SizedBox(height: screenSize.width/400),Text('0.00', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),
                                                        Column(children:[SizedBox(height: screenSize.width/400),Text('0.00', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),

                                                      ]),
                                                      TableRow(
                                                          children: [
                                                            Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/60))]),
                                                            Column(children:[Text('', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/60))]),
                                                            Column(children:[Text('', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/60))]),

                                                          ]),
                                                      TableRow( children: [
                                                        Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('美元', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),
                                                        Column(children:[SizedBox(height: screenSize.width/400),Text('0.00', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),
                                                        Column(children:[SizedBox(height: screenSize.width/400),Text('0.00', style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: screenSize.width/30))]),

                                                      ]),
                                                    ],
                                                  ),
                                                )
                                            ),],)


                                          ],
                                        )):Container()
                                  ],
                                )

                            ),)
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
                                        Stack(children: [
                                          Container(margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10,),child:  Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Comparison",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 20,
                                                    color: Colors.white),),

                                            ],),),
                                          GestureDetector(onTap:(){
                                            pageProvider.click_expand();
                                          },
                                            child:  Container(
                                              margin: EdgeInsets.only(top:screenSize.width/12),
                                              child: Column(
                                                children: comparisons_widgets
                                              ),
                                            ),),

                                          Container(margin:EdgeInsets.only(top:screenSize.width/15,left: screenSize.width*0.85),child:  Image.asset("assets/magic.png"), )

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