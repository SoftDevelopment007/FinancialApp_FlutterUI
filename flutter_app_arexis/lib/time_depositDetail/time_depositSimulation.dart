import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/return_alert.dart';
import 'package:flutter_app_arexis/time_depositDetail/deposit_open.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetailProvider.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_animation_kit/tap_animation_kit.dart';
import 'edit_open.dart';
List<String> periods = [
  "1 WK",
  "1 M",
  "3 M",
  "6 M",
  "1 YR",

];


void showdepositSimulationModal(context,time_deposit__detail) {
  var screenSize = MediaQuery
      .of(context)
      .size;

  double iget=time_deposit__detail['rate'];
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
                                        SizedBox(height: screenSize.width/15),
                                        Container( margin:EdgeInsets.only(left: screenSize.width/10),child:  Text("Locked-Up Assets",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/27 ),), ),
                                        SizedBox(height: screenSize.width/30),
                                        Stack(
                                          children: [
                                            Container(margin:EdgeInsets.only(top:screenSize.width/20,left: screenSize.width/15,right: screenSize.width/15),height:screenSize.width/10,child: FlutterSlider(
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
                                            Container(margin:EdgeInsets.only(left: screenSize.width/10,top: screenSize.width/17),child: Column(
                                              children: [
                                                Image.asset("assets/polygon.png",height: screenSize.width/20,),
                                                SizedBox(height: screenSize.width/200,),
                                                Text("Today",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/40,color: kBackgoundColor33),)
                                              ],
                                            ),),


                                            Container(margin:EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10),child:      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [ Container(width:screenSize.width/3,child:    Column( mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Affected Goals",style: TextStyle(fontWeight:FontWeight.bold,color: kBackgoundColor4,fontSize: screenSize.width/30),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("3",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),),
                                                    Text(" Goals",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30,),)
                                                  ],)

                                              ],
                                            ),),Container(width:screenSize.width/3,child:    Column( mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: screenSize.width/22,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("10",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/30),),
                                                    Text(" Goals",style: TextStyle(color: Colors.white,fontSize: screenSize.width/30,),)
                                                  ],)

                                              ],
                                            ),)],), ),
                                          ],
                                        ),

                                  Container(margin:EdgeInsets.only(top: screenSize.width/50,left: screenSize.width/15,right: screenSize.width/15),child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Jan 2020",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40),),
                                      Text("Jan 2020",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40),),
                                      Text("Jan 2020",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40),),
                                      Text("Jan 2020",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40),),
                                      Text("Jan 2020",style: TextStyle(color: Colors.white,fontSize: screenSize.width/40),),
                                    ])),
                                        Container(margin:EdgeInsets.only(top: screenSize.width/20,left: screenSize.width/10),child: Row(
                                          children: [
                                            Text("Return Simulator",style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/25,color: kBackgoundColor18),),
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
                                                  padding: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10,top: screenSize.width/35),
                                                  margin: EdgeInsets.only(top: screenSize.width*0.18),
                                                  decoration: BoxDecoration(borderRadius:BorderRadius.only(bottomLeft:Radius.circular(screenSize.width/20),bottomRight: Radius.circular(screenSize.width/20)),color: kBackgoundColor25),
                                                  height: screenSize.width*0.21,
                                                  width: screenSize.width*0.84,
                                                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("I get",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: screenSize.width/27),),
                                                      Expanded(child: Container(child:
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SizedBox(),
                                                          Text("${(pageProvider.invest*iget).toStringAsFixed(1)}",style: TextStyle(color: Colors.white,fontSize: screenSize.width/10),),
                                                          Text("HKD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/22,height:1.2 )),
                                                        ],),),),


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