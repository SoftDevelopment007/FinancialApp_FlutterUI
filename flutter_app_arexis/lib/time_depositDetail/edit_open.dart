import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetailProvider.dart';
import 'package:flutter_app_arexis/credit_cardDetail/CustomSliderThumbRect.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetailProvider.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:tap_animation_kit/tap_animation_kit.dart';

typedef doubleList = void Function(List<double>);
class edit_open extends StatelessWidget {
  edit_open(this.onPressed);
  doubleList onPressed;
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
                    return Material(color: Colors.transparent,
                        child: Container(
                            height: screenSize.height * 0.9, child: Stack(
                          children: <Widget>[
                            // Max Size
                            Container(
                                margin: EdgeInsets.only(top: screenSize.width *
                                    0.18),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                            screenSize.width / 20),
                                        bottomRight: Radius.circular(
                                            screenSize.width / 20)),
                                    color: kBackgoundColor25),
                                width: screenSize.width * 0.84,
                                child: NotificationListener<OverscrollIndicatorNotification>(
                                    onNotification: (OverscrollIndicatorNotification overscroll) {
                                      overscroll.disallowGlow();
                                      return;
                                    },
                                    child: SingleChildScrollView(child: Column(
                                  children: [
                                    SizedBox(height: screenSize.width / 10),
                                    Text("How much would you like to spend?",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: screenSize.width / 27,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: screenSize.width / 60),

                                    Container(width: screenSize.width / 1.7,
                                        height: screenSize.width / 6,
                                        padding: EdgeInsets.only(
                                            left: screenSize.width / 8),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                screenSize.width / 30),
                                            color: kBackgoundColor31.withAlpha(
                                                100)),
                                        child:
                                        Center(child: TextFormField(
                                          inputFormatters: [
                                            new LengthLimitingTextInputFormatter(
                                                6), // for mobile
                                          ],
                                          onFieldSubmitted: (value) {
                                            if (value == '') {
                                              pageProvider.put_sum(0);
                                            }
                                            pageProvider.put_sum(
                                                double.parse(value));
                                          },
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(color: Colors.white,
                                              fontSize: screenSize.width / 15),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                              hintText: "I would like to invest...",
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  color: Colors.white38,
                                                  fontSize: screenSize.width /
                                                      30)),))),
                                    SizedBox(height: screenSize.width / 10),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit1.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Dinning",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit1
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit1
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit1,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit1);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit1_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.width / 30),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit2.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Home",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit2
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit2
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit2,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit2);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit2_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.width / 30),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit3.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Financial",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit3
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit3
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit3,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit3);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit3_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.width / 30),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit4.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Shopping",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit4
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit4
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit4,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit4);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit4_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.width / 30),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit5.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Transportation",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit5
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit5
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit5,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit5);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit5_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.width / 30),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit6.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Leisure",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit6
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit6
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit6,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit6);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit6_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.width / 30),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit7.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Healthcare",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit7
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit7
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit7,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit7);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit7_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenSize.width / 30),
                                    Row(
                                      children: [
                                        SizedBox(width: screenSize.width / 15,),
                                        Image.asset("assets/edit8.png",
                                          height: screenSize.width / 12,),
                                        SizedBox(width: screenSize.width / 30),
                                        Container(width: screenSize.width / 1.6,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: screenSize.width / 1.7,
                                                  padding: EdgeInsets.only(
                                                      right: screenSize.width /
                                                          100),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text("Others",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: screenSize
                                                                .width / 30),),
                                                      Text("\$" +
                                                          pageProvider.edit8
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: screenSize
                                                                  .width / 25))
                                                    ],),),

                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    activeTrackColor: kBackgoundColor33,
                                                    inactiveTrackColor: kBackgoundColor32,
                                                    trackShape: RectangularSliderTrackShape(),
                                                    trackHeight: screenSize
                                                        .width / 80,
                                                    thumbColor: kBackgoundColor33,
                                                    thumbShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 20,
                                                        thumbRadius: screenSize
                                                            .width / 30,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                    overlayColor: kBackgoundColor18
                                                        .withAlpha(10),
                                                    overlayShape: CustomSliderThumbRect(
                                                        thumbHeight: screenSize
                                                            .width / 15,
                                                        thumbRadius: screenSize
                                                            .width / 20,
                                                        min: 0,
                                                        max: 1
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    label: pageProvider.edit8
                                                        .toString(),
                                                    min: 0,
                                                    max: pageProvider.sum,
                                                    value: pageProvider.edit8,
                                                    onChanged: (value) {
                                                      pageProvider.get_edit_sum(
                                                          pageProvider.edit8);
                                                      if (value + pageProvider
                                                          .edit_sum <=
                                                          pageProvider.sum) {
                                                        pageProvider
                                                            .edit8_change(
                                                            value);
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    GestureDetector(onTap: () {
                                      onPressed([pageProvider.sum,pageProvider.edit1,pageProvider.edit2,pageProvider.edit3,pageProvider.edit4,pageProvider.edit5,pageProvider.edit6,pageProvider.edit7,pageProvider.edit8]);
                                      Navigator.pop(context);
                                    }, child: Container(
                                        margin: EdgeInsets.only(
                                            top: screenSize.width / 10),
                                        height: screenSize.width / 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                    screenSize.width / 30),
                                                bottomRight: Radius.circular(
                                                    screenSize.width / 30)),
                                            color: kBackgoundColor26),
                                        child: Center(
                                            child: Container(
                                              height: screenSize.width / 9,
                                              width: screenSize.width / 3,
                                              decoration: BoxDecoration(
                                                  color: kBackgoundColor35,
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      screenSize.width / 10)),
                                              child: Center(child: Text("Done",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: screenSize.width /
                                                        22),)),
                                            )
                                        )
                                    ))


                                  ],
                                )))
                            ),
                            Container(
                              padding: EdgeInsets.only(left: screenSize.width /
                                  10, right: screenSize.width / 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          screenSize.width / 20),
                                      topRight: Radius.circular(
                                          screenSize.width / 20)),
                                  gradient: kLinearGradient3),
                              height: screenSize.width * 0.18,
                              width: screenSize.width * 0.84,
                              child: Row(mainAxisAlignment: MainAxisAlignment
                                  .spaceEvenly,
                                children: [
                                  Text("I spent", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kBackgoundColor18,
                                      fontSize: screenSize.width / 27),),
                                  Container(width: screenSize.width * 0.35,
                                    child: Center(child: Text(
                                      "${(pageProvider.sum).toInt()}",
                                      style: TextStyle(color: kBackgoundColor18,
                                          fontSize: screenSize.width / 10),),
                                    ),),
                                  Column(children: [
                                    SizedBox(height: screenSize.width / 13,),
                                    Text("HKD", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kBackgoundColor18,
                                        fontSize: screenSize.width / 22),)
                                  ],),

                                ],),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: screenSize.width *
                                  0.084, top: screenSize.width * 0.015),
                              margin: EdgeInsets.only(top: screenSize.width *
                                  0.14, left: screenSize.width * 0.1),
                              decoration: BoxDecoration(
                                  color: kBackgoundColor26,
                                  borderRadius: BorderRadius.circular(
                                      screenSize.width * 0.08)),
                              height: screenSize.width * 0.08,
                              width: screenSize.width * 0.22,
                              child: Text("Edit", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: screenSize.width / 26),),
                            ),
                            GestureDetector(onTap: () {}, child: Container(
                              margin: EdgeInsets.only(
                                  top: screenSize.width * 0.137,
                                  left: screenSize.width * 0.07),
                              decoration: BoxDecoration(
                                  color: kBackgoundColor27,
                                  borderRadius: BorderRadius.circular(
                                      screenSize.width * 0.08)),
                              height: screenSize.width * 0.085,
                              width: screenSize.width * 0.085,
                              child: Image.asset("assets/recycle.png",
                                height: screenSize.width * 0.1,
                                width: screenSize.width * 0.1,),
                            ))
                          ],
                        )));
                  });
            }));
  }

}








