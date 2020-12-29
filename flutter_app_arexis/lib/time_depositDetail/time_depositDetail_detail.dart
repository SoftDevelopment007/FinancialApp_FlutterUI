import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetail.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

void showtimedepositDetail_detaillModal(context,time_depositDetail) {
  var screenSize = MediaQuery.of(context).size;
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
                                       Container(margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10,),child:Text(time_depositDetail['description'],style: TextStyle(color: Colors.white,fontSize: screenSize.width/30))
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