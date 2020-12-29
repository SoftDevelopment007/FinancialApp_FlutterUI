import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_arexis/Credit_Card/credit_card.dart';
import 'package:flutter_app_arexis/ETF/etf.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetatil.dart';
import 'package:flutter_app_arexis/Time_deposit/time_deposit.dart';
import 'package:flutter_app_arexis/coupon/coupon.dart';
import 'package:flutter_app_arexis/coupon_detail/coupon_detail.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail.dart';
import 'package:flutter_app_arexis/models/credit_card_list.dart';
import 'package:flutter_app_arexis/models/time_deposit_list.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetail.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import '../Filter/filter.dart';
import 'marketplaceProvider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:jiffy/jiffy.dart';

class marketplace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return ChangeNotifierProvider<marketplaceProvider>(
        create: (context) => marketplaceProvider(),
        child: Builder(
            builder: (context)
            {
              return Consumer<marketplaceProvider>(
                builder: (context, pageProvider,child){
                  return Scaffold(
                    backgroundColor: kBackgoundColor,
                    body:NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowGlow();
                          return;
                        },
                        child:
                        SingleChildScrollView(

                          child: Container(
                            padding: EdgeInsets.only(bottom: screenSize.width/3.5),
                            decoration: BoxDecoration(color: kBackgoundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left:  screenSize.width/15,bottom:  screenSize.width/30),
                                    child:Text("Marketplace",style: TextStyle(fontWeight:FontWeight.bold,fontSize:  screenSize.width/13,color: Colors.white),)
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top:screenSize.width/200),
                                      padding: EdgeInsets.only(right:screenSize.width/30 ),
                                      height: screenSize.width/10,
                                      width: screenSize.width/1.2,
                                      decoration: BoxDecoration(
                                        color: kBackgoundColor29,
                                        borderRadius:  BorderRadius.circular(screenSize.width/18.0),
                                      ),
                                      child: TextFormField(
                                        cursorColor: Colors.white,
                                        style: TextStyle(fontSize:screenSize.width/20,color: Colors.white),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            isDense: true,
                                            contentPadding: EdgeInsets.only(left: screenSize.width/4,top:screenSize.width/80),
                                            suffixIcon: Image.asset("assets/search.png")
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: screenSize.width/35),
                                      height: screenSize.width/9,
                                      width:  screenSize.width/5.5,
                                      decoration: BoxDecoration(
                                          color: kBackgoundColor28,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                                      ),
                                      child: IconButton(
                                          icon: Image.asset(
                                            "assets/setting.png",
                                            height: screenSize.width/17,
                                          ),
                                          onPressed: () {
                                            showModal(context);
                                          }),
                                    ),
                                  ],
                                ),


                                FutureBuilder(
                                  future: pageProvider.getdata(context),
                                  builder: (context,snapshot){
                                    if(snapshot.hasData){
                                      final data=snapshot.data;
                                      /////////////////////////////////////////////////////////////////////////////////////////time deposit
                                      final timedepsitListsWidgets = <Widget>[];
                                      for(int i=0;i<data['term_deposit'].length;i++){
                                        timedepsitListsWidgets.add(InkWell(onTap:(){
                                          StorageUtil.getInstance();
                                          StorageUtil.putString("detail_id", data['term_deposit'][i]['product_id'] );
                                          Navigator.push(context, MaterialPageRoute(builder:(context) => time_depositDetail()));
                                        },child:  Container(
                                            height: screenSize.width*0.33,
                                            width: screenSize.width/1.7,
                                            margin: EdgeInsets.only(left: screenSize.width/18),
                                            padding: EdgeInsets.only(left:screenSize.width/30,right:screenSize.width/40,top:screenSize.width/30,bottom: screenSize.width/40),
                                            decoration: BoxDecoration(
                                              color: kBackgoundColor3,
                                              borderRadius: BorderRadius.all(Radius.circular(screenSize.width/40)),
                                            ),
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(width: screenSize.width/2.1,height:screenSize.width*0.125,
                                                  child:  Text(data['term_deposit'][i]['product_name'] ,maxLines:2,overflow:TextOverflow.ellipsis,textAlign:TextAlign.start,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/23,color: Colors.white),),
                                                ),
                                                SizedBox(height: screenSize.width/80),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("${data['term_deposit'][i]['rate'] *100}%",style: TextStyle(fontSize: screenSize.width/16,color: kBackgoundColor4),),
                                                        Text("Annual interest rate",style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                                                      ],
                                                    ),
                                                    SizedBox(width: screenSize.width/80),
                                                    Column(
                                                      children: [
                                                        Text("${data['term_deposit'][i]['period'] }",style: TextStyle(fontSize: screenSize.width/16,color: kBackgoundColor4),),
                                                        Text("${data['term_deposit'][i]['period_type'] }",style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                                                      ],
                                                    ),
                                                    SizedBox(width: screenSize.width/80,),
                                                    Column(
                                                      children: [
                                                        Container(
                                                            height: screenSize.width/12,
                                                            width: screenSize.width/12,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.all(Radius.circular(screenSize.width/12))
                                                            ),
                                                            child:  Center(child:  Image.asset("assets/bank.png",height: screenSize.width/15),)
                                                        ),
                                                        Container(margin: EdgeInsets.only(top:screenSize.width/100),
                                                          width: screenSize.width/7.5,
                                                          child:Text(data['term_deposit'][i]['bank_name'], overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
                                                        ),

                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                        ),));
                                      }

                                      ///////////////////////////////////////////////////////////////////////////////////////////etf
                                      final etfListsWidgets = <Widget>[];
                                      for(int i=0;i<data['etf'].length;i++){
                                        etfListsWidgets.add(InkWell(onTap:(){
                                          StorageUtil.getInstance();
                                          StorageUtil.putString("detail_id", data['etf'][i]['product_id'] );

                                          Navigator.push(context, MaterialPageRoute(builder: (context) => etfDetail(),));
                                        },child:  Container(
                                            width: screenSize.width/1.7,
                                            margin: EdgeInsets.only(left: screenSize.width/18),
                                            padding: EdgeInsets.only(left:screenSize.width/35,right:screenSize.width/35,top:screenSize.width/25,bottom: screenSize.width/25),
                                            decoration: BoxDecoration(
                                              color: kBackgoundColor3,
                                              borderRadius: BorderRadius.all(Radius.circular(screenSize.width/50)),
                                            ),
                                            child:Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:screenSize.width/4,
                                                      height: screenSize.width/12,
                                                      child: Image.asset("assets/graph1.png",fit: BoxFit.fitWidth,),
                                                    ),
                                                    Container(
                                                      width:screenSize.width/4 ,
                                                      child:Text(data['etf'][i]['etf_code'],style: TextStyle(color: Colors.white,fontSize: screenSize.width/18)),)
                                                  ],
                                                ),
                                                SizedBox(width:screenSize.width/80),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(data['etf'][i]['etf_price'].toString(),style: TextStyle(fontSize: screenSize.width/16, color: Colors.white),),
                                                    SizedBox(height: screenSize.width/120),
                                                    Row(
                                                      children: [
                                                        Image.asset("assets/arrow.png",height: screenSize.width/60,),
                                                        SizedBox(width: screenSize.width/100,),
                                                        Text("${data['etf'][i]['etf_price_change']}(${data['etf'][i]['etf_price_change_percentage']})",style: TextStyle(fontSize:screenSize.width/30,color: Colors.red),)
                                                      ],
                                                    ),
                                                    SizedBox(height: screenSize.width/120),
                                                    Container(width:screenSize.width/4,child:  Text(data['etf'][i]['etf_last_updated'], overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(color: Colors.grey,fontSize: screenSize.width/40),))

                                                  ],
                                                )
                                              ],
                                            )
                                        ), ));
                                      }

                                      /////////////////////////////////////////////////////////////////////////////////////credit card
                                      final creditcardListsWidgets = <Widget>[];
                                      for(int i=0;i<data['credit_card'].length;i++){
                                        creditcardListsWidgets.add(InkWell(onTap:(){
                                          StorageUtil.getInstance();
                                          StorageUtil.putString("detail_id", data['credit_card'][i]['product_id'] );
                                          Navigator.push(context, MaterialPageRoute(builder:(context) => credit_cardDetail()));
                                        },child: Container(
                                            width: screenSize.width/1.7,
                                            margin: EdgeInsets.only(left: screenSize.width/18),
                                            padding:EdgeInsets.only(top:screenSize.width/20,bottom: screenSize.width/30),
                                            decoration: BoxDecoration(
                                              color: kBackgoundColor3,
                                              borderRadius: BorderRadius.all(Radius.circular(screenSize.width/50)),
                                            ),
                                            child:Column(mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: screenSize.width/36,),
                                                    Container(
                                                        height:screenSize.width/12 ,
                                                        width: screenSize.width/8,
                                                        child: Image.network(data['credit_card'][i]['imgURL'],fit: BoxFit.cover,)
                                                    ),
                                                    SizedBox(width: screenSize.width/60),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(

                                                          child:Text(data['credit_card'][i]['bank_name'], overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/45,color:Colors.white),),
                                                        ),
                                                        Container(
                                                          width: screenSize.width/2.5,
                                                          child:Text(data['credit_card'][i]['product_name'], overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/32,color:Colors.white),),
                                                        ),
                                                        SizedBox(height: screenSize.width/72),
                                                        Text("+\$${data['credit_card'][i]['saved_amount'].toStringAsFixed(2)}",style: TextStyle(fontSize:screenSize.width/23,color:kBackgoundColor4),),
                                                        Text("Saved money",style: TextStyle(fontSize:screenSize.width/40,color:kBackgoundColor4),),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],)
                                        ) ));
                                      }

                                      //////////////////////////////////////////////////////////////////////////////////// featured
                                      final featuredListsWidgets = <Widget>[];
                                      for(int i=0;i<data['featured'].length;i++){
                                        featuredListsWidgets.add(InkWell(onTap:(){
                                          StorageUtil.getInstance();
                                          StorageUtil.putString("detail_id", data['featured'][i]['product_id'] );
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => etfDetail(),));
                                        },child:  Container(
                                            width: screenSize.width/1.7,
                                            margin: EdgeInsets.only(left: screenSize.width/18),
                                            padding: EdgeInsets.only(left:screenSize.width/35,right:screenSize.width/35,top:screenSize.width/25,bottom: screenSize.width/25),
                                            decoration: BoxDecoration(
                                              color: kBackgoundColor3,
                                              borderRadius: BorderRadius.all(Radius.circular(screenSize.width/50)),
                                            ),
                                            child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:screenSize.width/4,
                                                      height: screenSize.width/12,
                                                      child: Image.asset("assets/graph1.png",fit: BoxFit.fitWidth,),
                                                    ),
                                                    Container(
                                                      width:screenSize.width/4 ,
                                                      child:Text(data['featured'][i]['etf_code'],style: TextStyle(color: Colors.white,fontSize: screenSize.width/18)),)
                                                  ],
                                                ),
                                                SizedBox(width:screenSize.width/80),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(data['featured'][i]['etf_price'].toString(),style: TextStyle(fontSize: screenSize.width/16, color: Colors.white),),
                                                    SizedBox(height: screenSize.width/120),
                                                    Row(
                                                      children: [
                                                        Image.asset("assets/arrow.png",height: screenSize.width/60,),
                                                        SizedBox(width: screenSize.width/100,),
                                                        Text("${data['featured'][i]['etf_price_change']}(${data['featured'][i]['etf_price_change_percentage']})",style: TextStyle(fontSize:screenSize.width/30,color: Colors.red),)
                                                      ],
                                                    ),
                                                    SizedBox(height: screenSize.width/120),
                                                    Container(width:screenSize.width/4,child:  Text(data['featured'][i]['etf_last_updated'], overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(color: Colors.grey,fontSize: screenSize.width/40),)
                                                    )

                                                  ],
                                                )
                                              ],
                                            )
                                        ) ));
                                      }
                                      return Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: screenSize.width/15,top: screenSize.width/10,bottom: screenSize.width/30),
                                              child:Text("Featured",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.white),)
                                          ),


                                          SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child:Container(padding:EdgeInsets.only(right: screenSize.width/18,),child: Row(
                                                  children:featuredListsWidgets
                                              ))),

                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: screenSize.width/15,top: screenSize.width/20,bottom: screenSize.width/40),
                                              child:Text("Time deposit",style: TextStyle(fontSize: screenSize.width/24,color: Colors.white),)
                                          ),

                                          SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child:Container(padding:EdgeInsets.only(right: screenSize.width/18,),child: Row(
                                                  children:timedepsitListsWidgets
                                              ))),


                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: screenSize.width/15,top: screenSize.width/20,bottom: screenSize.width/40),
                                              child:Text("Credit Card",style: TextStyle(fontSize: screenSize.width/24,color: Colors.white),)
                                          ),

                                          SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child:Container(padding:EdgeInsets.only(right: screenSize.width/18,),child: Row(
                                                  children:creditcardListsWidgets
                                              ))),

                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: screenSize.width/15,top: screenSize.width/20,bottom: screenSize.width/40),
                                              child:Text("ETF",style: TextStyle(fontSize: screenSize.width/24,color: Colors.white),)
                                          ),

                                          SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child:Container(padding:EdgeInsets.only(right: screenSize.width/18,),child: Row(
                                                  children:etfListsWidgets
                                              ))),

                                          GestureDetector(onTap:(){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder:
                                                    (context) =>
                                                    coupon()
                                                ));
                                          },child:    Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(left: screenSize.width/15,top: screenSize.width/20,bottom: screenSize.width/40),
                                              child:Text("Coupon",style: TextStyle(fontSize: screenSize.width/24,color: Colors.white),)
                                          ), ),
                                          SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child:Container(padding: EdgeInsets.only(right: screenSize.width/18),child: Row(
                                                children: [
                                                  GestureDetector(onTap:(){
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder:
                                                            (context) =>
                                                            coupon_detail()
                                                        ));
                                                  },child:   Container(

                                                      width: screenSize.width/2,
                                                      margin: EdgeInsets.only(left: screenSize.width/18),
                                                      padding:EdgeInsets.only(left:screenSize.width/40,right:screenSize.width/80, ),
                                                      decoration: BoxDecoration(
                                                        color: kBackgoundColor3,
                                                        borderRadius: BorderRadius.all(Radius.circular(screenSize.width/50)),
                                                      ),
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          SizedBox(width: screenSize.width/36,),
                                                          Container(
                                                            width: screenSize.width/15,
                                                          ),
                                                          DottedLine(
                                                            direction: Axis.vertical,
                                                            lineLength:screenSize.width/4.5,
                                                            lineThickness: 0.6,
                                                            dashLength: 3,
                                                            dashColor: Colors.white,
                                                            dashRadius: 0.0,
                                                            dashGapLength: 4.0,
                                                            dashGapColor: Colors.transparent,
                                                            dashGapRadius: 0.0,
                                                          ),
                                                          SizedBox(width: screenSize.width/20,),
                                                          Container(child: Column(

                                                            children: [
                                                              Container(margin: EdgeInsets.only(top: screenSize.width/30),
                                                                width: screenSize.width/3.3,
                                                                child:Text("Apple iTunes", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/25,color:Colors.white),),
                                                              ),
                                                              SizedBox(height: screenSize.width/72),

                                                              Container(margin: EdgeInsets.only(bottom: screenSize.width/30),
                                                                width: screenSize.width/3.3,
                                                                child:Text("300 Cash coupon", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontSize:screenSize.width/32,color:Colors.white),),
                                                              ),
                                                            ],
                                                          ),)

                                                        ],
                                                      )
                                                  ),),
                                                  GestureDetector(onTap:(){
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder:
                                                            (context) =>
                                                            coupon_detail()
                                                        ));
                                                  },child:   Container(

                                                      width: screenSize.width/2,
                                                      margin: EdgeInsets.only(left: screenSize.width/18),
                                                      padding:EdgeInsets.only(left:screenSize.width/40,right:screenSize.width/80, ),
                                                      decoration: BoxDecoration(
                                                        color: kBackgoundColor3,
                                                        borderRadius: BorderRadius.all(Radius.circular(screenSize.width/50)),
                                                      ),
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          SizedBox(width: screenSize.width/36,),
                                                          Container(
                                                            width: screenSize.width/15,
                                                          ),
                                                          DottedLine(
                                                            direction: Axis.vertical,
                                                            lineLength:screenSize.width/4.5,
                                                            lineThickness: 0.6,
                                                            dashLength: 3,
                                                            dashColor: Colors.white,
                                                            dashRadius: 0.0,
                                                            dashGapLength: 4.0,
                                                            dashGapColor: Colors.transparent,
                                                            dashGapRadius: 0.0,
                                                          ),
                                                          SizedBox(width: screenSize.width/20,),
                                                          Container(child: Column(

                                                            children: [
                                                              Container(margin: EdgeInsets.only(top: screenSize.width/30),
                                                                width: screenSize.width/3.3,
                                                                child:Text("Apple iTunes", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/25,color:Colors.white),),
                                                              ),
                                                              SizedBox(height: screenSize.width/72),

                                                              Container(margin: EdgeInsets.only(bottom: screenSize.width/30),
                                                                width: screenSize.width/3.3,
                                                                child:Text("300 Cash coupon", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontSize:screenSize.width/32,color:Colors.white),),
                                                              ),
                                                            ],
                                                          ),)

                                                        ],
                                                      )
                                                  ),),
                                                  GestureDetector(onTap:(){
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder:
                                                            (context) =>
                                                            coupon_detail()
                                                        ));
                                                  },child:   Container(

                                                      width: screenSize.width/2,
                                                      margin: EdgeInsets.only(left: screenSize.width/18),
                                                      padding:EdgeInsets.only(left:screenSize.width/40,right:screenSize.width/80, ),
                                                      decoration: BoxDecoration(
                                                        color: kBackgoundColor3,
                                                        borderRadius: BorderRadius.all(Radius.circular(screenSize.width/50)),
                                                      ),
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          SizedBox(width: screenSize.width/36,),
                                                          Container(
                                                            width: screenSize.width/15,
                                                          ),
                                                          DottedLine(
                                                            direction: Axis.vertical,
                                                            lineLength:screenSize.width/4.5,
                                                            lineThickness: 0.6,
                                                            dashLength: 3,
                                                            dashColor: Colors.white,
                                                            dashRadius: 0.0,
                                                            dashGapLength: 4.0,
                                                            dashGapColor: Colors.transparent,
                                                            dashGapRadius: 0.0,
                                                          ),
                                                          SizedBox(width: screenSize.width/20,),
                                                          Container(child: Column(

                                                            children: [
                                                              Container(margin: EdgeInsets.only(top: screenSize.width/30),
                                                                width: screenSize.width/3.3,
                                                                child:Text("Apple iTunes", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/25,color:Colors.white),),
                                                              ),
                                                              SizedBox(height: screenSize.width/72),

                                                              Container(margin: EdgeInsets.only(bottom: screenSize.width/30),
                                                                width: screenSize.width/3.3,
                                                                child:Text("300 Cash coupon", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontSize:screenSize.width/32,color:Colors.white),),
                                                              ),
                                                            ],
                                                          ),)

                                                        ],
                                                      )
                                                  ),),

                                                ],
                                              ),)
                                          )

                                        ],
                                      );


                                    }else if (snapshot.hasError) {
                                      return snapshot.error;
                                    }
                                    return Container(
                                        width: screenSize.width,height: screenSize.height*0.7,
                                        child: Center(
                                        child: CircularProgressIndicator()) );  },
                                ),


                              ],
                            ),
                          ),)),
                  );
                },
              );
            }
        ));
  }

}