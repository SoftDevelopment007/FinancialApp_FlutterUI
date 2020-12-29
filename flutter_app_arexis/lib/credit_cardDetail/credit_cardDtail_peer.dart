import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
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

void showcredit_cardDetail_peerModal(context,credit_cardDetail) {
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
                        final peer=credit_cardDetail['peer'];
                        final peers=<Widget>[];
                        for(int i=0;i<peer.length;i++){
                          final specials=<Widget>[];
                          final special=credit_cardDetail['peer'][i]['feature'];
                             for(int j=0;j<special.length;j++){
                               specials.add(Text(credit_cardDetail['peer'][i]['feature'][j],style: TextStyle(color: Colors.white,fontSize: screenSize.width/25),),);
                             }
                          peers.add(
                            GestureDetector(onTap:(){
                              pageProvider.change_peer_open(i);
                            },child: AnimatedContainer(duration: const Duration(milliseconds: 250),
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
                                              child:Text(credit_cardDetail['peer'][i]['bank_name'], overflow: TextOverflow.ellipsis,maxLines:2,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
                                            ),
                                            Container(
                                              width: screenSize.width/1.7,
                                              child:Text(credit_cardDetail['peer'][i]['product_name'], overflow: TextOverflow.ellipsis,maxLines:2,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/22,color:Colors.white),),
                                            ),
                                            SizedBox(height: screenSize.width/72),
                                            Row(children: [
                                              Text("+\$${credit_cardDetail['peer'][i]['saved_amount'].toStringAsFixed(2)}",style: TextStyle(fontSize:screenSize.width/16,color:kBackgoundColor4),),
                                              SizedBox(width: screenSize.width/30,),
                                              Column(
                                                children: [
                                                  SizedBox(height: screenSize.width/70,),
                                                  Text("Saved money",style: TextStyle(fontSize:screenSize.width/35,color:kBackgoundColor4),),
                                                ],
                                              )

                                            ],)

                                          ],
                                        )
                                      ],
                                    ),
                                    pageProvider.peer_open[i]?Container(width: screenSize.width,
                                        padding: EdgeInsets.only(
                                            top:screenSize.width/30,
                                            left: screenSize.width/60,
                                            right: screenSize.width/60,
                                            bottom: screenSize.width / 60),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: screenSize.width/30,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Container(child: Text(
                                                  "New comer on",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: Colors.white),),),
                                                Container(child: Text("Maximum ${credit_cardDetail['peer'][i]['earned_mile'].toStringAsFixed(2)}",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: kBackgoundColor4),),),
                                              ],
                                            ),
                                            SizedBox(height: screenSize.width/60,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Container(child: Text(
                                                  "Minimum Income Requirement",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: Colors.white),),),
                                                Container(child: Text("HKD ${credit_cardDetail['peer'][i]['min_income'].toStringAsFixed(2)}",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: Colors.white),),),
                                              ],
                                            ),
                                            SizedBox(height: screenSize.width/60,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Container(child: Text(
                                                  "Minimum Age Requirement",
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: Colors.white),),),
                                                Container(child: Text(credit_cardDetail['peer'][i]['min_age'].toString(),
                                                  style: TextStyle(
                                                      fontSize: screenSize.width / 30,
                                                      color: Colors.white),),),
                                              ],
                                            ),
                                            SizedBox(height: screenSize.width/20,),
                                            Text("Special",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/22),),
                                            Column(
                                              children: specials,
                                            )

                                          ],
                                        )):Container()
                                  ],
                                )

                            ) )
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
                                        Stack(children: [
                                          Container(margin: EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/10,),child:  Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Peer",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenSize.width / 20,
                                                    color: Colors.white),),

                                            ],),),
                                          Container(
                                            margin: EdgeInsets.only(top:screenSize.width/12),
                                            child: Column(
                                                children:peers
                                            ),
                                          ),

                                          Container(margin:EdgeInsets.only(top:screenSize.width/15,left: screenSize.width*0.85),child:  Image.asset("assets/magic.png"), )

                                        ],)

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