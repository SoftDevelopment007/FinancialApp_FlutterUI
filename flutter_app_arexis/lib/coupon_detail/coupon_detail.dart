import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/chart.dart';
import 'package:flutter_app_arexis/ETFDetail/detail.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetailProvider.dart';
import 'package:flutter_app_arexis/ETFDetail/peer.dart';
import 'package:flutter_app_arexis/ETFDetail/simulation.dart';
import 'package:flutter_app_arexis/coupon_detail/alert_box.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail_detail.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail_offer.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDtail_peer.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDtail_simulation.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'coupon_detailProvider.dart';

class coupon_detail extends StatefulWidget {
  @override
  _coupon_detail createState() => _coupon_detail();

}
class _coupon_detail extends State<coupon_detail> {
 bool redeem=false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return ChangeNotifierProvider<coupon_detailProvier>(
        create: (context) => coupon_detailProvier(),
        child: Builder(
            builder: (context) {
              return Consumer<coupon_detailProvier>(
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
                      body: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: screenSize.width / 10),
                            decoration: BoxDecoration(color: kBackgoundColor),
                            child: Column(
                              children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left:  screenSize.width/15, bottom:  screenSize.width/30),
                                child:Text("Apple iTunes",style: TextStyle(fontWeight:FontWeight.bold,fontSize:  screenSize.width/13,color: Colors.white),)
                            ),
                              SizedBox(height: screenSize.width/20),
                              Container(width: screenSize.width,height: screenSize.width*1.5,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/couponDetail_bac.png",),fit: BoxFit.fill)),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(margin:EdgeInsets.only(top: screenSize.width/5,left: screenSize.width/1.5),width: screenSize.width/3,child: Text("Apple iTunes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/12),),),
                                  Container(margin:EdgeInsets.only(top: screenSize.width/10,left: screenSize.width/5),width: screenSize.width/1.5,child:  Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("300 Cash Coupon",style: TextStyle(color: Colors.white,fontSize: screenSize.width/15),),

                                    ],),),
                                  Container(margin:EdgeInsets.only(top:screenSize.width/60,left: screenSize.width/4),width: screenSize.width/2.5,child:  Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Expiry date:",style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),

                                    ],),),
                                  GestureDetector(onTap:(){
                                    showGeneralDialog(
                                        barrierColor: kBackgoundColor32.withAlpha(220),
                                        transitionBuilder: (context, a1, a2, widget) {
                                          return Transform.scale(
                                              scale: a1.value,
                                              child: Center(child:coupon_alertBox((){
                                                setState(() {
                                                  redeem=true;
                                                });
                                              }))
                                          );
                                        },
                                        transitionDuration: Duration(milliseconds: 200),
                                        barrierDismissible: true,
                                        barrierLabel: '',
                                        context: context,
                                        pageBuilder: (context, animation1, animation2) {
                                          return coupon_alertBox((){
                                            setState(() {
                                              redeem=true;
                                            });
                                          });
                                        });
                                  },child:  Container(
                                    margin: EdgeInsets.only(left:screenSize.width/3.6,top: screenSize.width/2.2),
                                    width: screenSize.width/2.3,height: screenSize.width/7,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenSize.width/15),color: Colors.white60),
                                    child: redeem?Center(child: Text("Redeemed",style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),):Column(
                                      children: [
                                        Container(height: screenSize.width/14,child:
                                        Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text("10",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.yellow,fontSize: screenSize.width/17,),),
                                            SizedBox(width: screenSize.width/40),
                                            Column(mainAxisAlignment:MainAxisAlignment.end,children: [   SizedBox(height: screenSize.width/80),Text("EXP.",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: screenSize.width/25,),),],)
                                          ],
                                        ), ),

                                        Text("Redeem",style: TextStyle(color: Colors.white,fontSize: screenSize.width/25),)
                                      ],
                                    ),
                                  ) ,)

                                ],
                              ),
                              ),],)
                            ))
                  );
                },
              );
            }
        ));
  }

}