import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

void showcredit_cardDetail_detaillModal(context,creditcardDetail) {
 Map<String,dynamic> benefits=creditcardDetail['benefits'];
 var screenSize = MediaQuery.of(context).size;
 final benefits_widgets=<Widget>[];
 for (String key in benefits.keys){
   benefits_widgets.add(
     Container(width: screenSize.width,
         padding: EdgeInsets.only(
             left: screenSize.width / 10,
             right: screenSize.width / 10,
             bottom: screenSize.width / 60),
         child: Row(
           mainAxisAlignment: MainAxisAlignment
               .spaceBetween,
           children: [
             Container(child: Text("$key Spending",
               style: TextStyle(
                   fontSize: screenSize.width / 30,
                   color: Colors.white),),),
             Container(child: Text( "${(benefits[key]['cash_rebate']??0)*100}%",
               style: TextStyle(
                   fontSize: screenSize.width / 30,
                   color: Colors.white),),),
           ],
         )),
   );
 }

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
                                        Container(margin: EdgeInsets.only(
                                            left: screenSize.width / 10,
                                            bottom: screenSize.width / 30),
                                          child: Text("Details",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenSize.width / 20,
                                                color: Colors.white),),),
                                        Container(margin: EdgeInsets.only(
                                            left: screenSize.width / 10,
                                            right: screenSize.width / 10,
                                            bottom: screenSize.width / 20),
                                          width: screenSize.width * 0.8,
                                          child: Text(
                                            creditcardDetail['description'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenSize.width /
                                                    30),),),
                                        SizedBox(height: screenSize.width / 30,),
                                        Container(width: screenSize.width,
                                            padding: EdgeInsets.only(
                                                left: screenSize.width / 10),
                                            child: Text("Benefits", style: TextStyle(
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
                                                Container(child: Text("Year-round rewards",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: kBackgoundColor4),),),
                                                Container(child: Text("Cash rebate",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: kBackgoundColor4),),),
                                              ],
                                            )),
                                        Column(
                                         children: benefits_widgets,
                                        )
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