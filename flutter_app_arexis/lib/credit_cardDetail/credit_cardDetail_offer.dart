import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetailProvider.dart';
import 'package:flutter_app_arexis/main_page_Provider.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import 'credit_cardDetailProvider.dart';
import 'credit_cardDetailProvider.dart';
import 'credit_cardDetailProvider.dart';

void showcredit_cardDetail_offerModal(context,credit_card_detail) {
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
                        ////////////////////////////////////////////////////////////////////////////////////////////////////////
                        final new_comer=credit_card_detail['new_comer_campaign'];
                        final options=<Widget>[];

                        new_comer.length==0?options.add(Container(width: screenSize.width*0.8,margin: EdgeInsets.only(left: screenSize.width/10),child:Text('None',style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/25),))):options.add(SizedBox());
                        for(int i=0;i<new_comer.length;i++){
                          options.add( InkWell(onTap:(){
                            if(pageProvider.select[i]==false){pageProvider.add_offer_max(new_comer[i]['details'][0]['option_value']); pageProvider.change_select(i);}
                          },child: Container(width: screenSize.width*0.8,margin: EdgeInsets.only(),child:Text("Option ${i+1} ${new_comer[i]['option']} ${new_comer[i]['details']!=[]?new_comer[i]['details'][0]['option_value'].toStringAsFixed(2):''}",style: TextStyle(color: kBackgoundColor4,fontSize: screenSize.width/25),)),));
                          for(int j=0;j<new_comer[i]['condition'].length;j++){
                            options.add(Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: screenSize.width/80,width:screenSize.width/80,margin:EdgeInsets.only(left: screenSize.width/10,right: screenSize.width/60,top: screenSize.width/60),decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(screenSize.width/160)),),
                                Container(width: screenSize.width*0.8,child:  Text(new_comer[i]['condition'][j],style: TextStyle(color: Colors.grey,fontSize: screenSize.width/25),))

                              ],
                            ));
                          }
                          options.add(SizedBox(height: screenSize.width/40));
                        }
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                          child: Text("Offer",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenSize.width / 20,
                                                color: Colors.white),),),
                                        Container(margin: EdgeInsets.only(
                                            left: screenSize.width / 10,
                                           ),
                                          child: Text("Maximum ${(credit_card_detail['saved_amount']+pageProvider.offer_max).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 20,
                                                color:kBackgoundColor4),),),
                                        Container(margin: EdgeInsets.only(
                                            left: screenSize.width / 10,
                                            bottom: screenSize.width / 20),
                                          child: Text("New comer earn",
                                            style: TextStyle(
                                                fontSize: screenSize.width / 25,
                                                color:Colors.white),),),
                                        Container(margin: EdgeInsets.only(
                                            left: screenSize.width / 10,
                                            bottom: screenSize.width / 50),
                                          child: Text("Option",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenSize.width / 20,
                                                color: Colors.white),),),

                                         Column(children:options)
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