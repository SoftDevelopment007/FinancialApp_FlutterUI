import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/Credit_Card/credit_cardProvider.dart';
import 'package:flutter_app_arexis/Credit_Card/linked.dart';
import 'package:flutter_app_arexis/Credit_Card/unlinked.dart';
import 'package:flutter_app_arexis/Credit_Card/unlinked_areix.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetatil.dart';
import 'package:flutter_app_arexis/coupon_detail/coupon_detail.dart';
import 'file:///C:/Users/admin/flutter_app_arexis/lib/Filter/filter.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';

class coupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return ChangeNotifierProvider<credit_cardProvider>(
        create: (context) => credit_cardProvider(),
        child: Builder(
            builder: (context)
            {
              return Consumer<credit_cardProvider>(
                builder: (context, pageProvider,child){
                  return Scaffold(
                      backgroundColor: kBackgoundColor,
                      appBar: AppBar(
                        centerTitle: true,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        title:Text(""),
                        flexibleSpace: Container(
                          decoration: BoxDecoration(color: kBackgoundColor),
                        ),
                        actions: [
                          IconButton(
                              icon: Image.asset(
                                "assets/nav.png",
                                height: screenSize.width/15,
                              ),
                              onPressed: () {
                              }),
                          SizedBox(width:screenSize.width/20)
                        ],
                      ),
                      body: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(bottom: screenSize.width/30),
                            decoration: BoxDecoration(color: kBackgoundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left:  screenSize.width/15, bottom:  screenSize.width/30),
                                    child:Text("Coupon",style: TextStyle(fontWeight:FontWeight.bold,fontSize:  screenSize.width/13,color: Colors.white),)
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
                                SizedBox(height: screenSize.width/10),
                                GestureDetector(onTap:(){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder:
                                          (context) =>
                                              coupon_detail()
                                      ));
                                },child: Container(
                                    width: screenSize.width,
                                    height: screenSize.width/4,
                                    padding: EdgeInsets.only(left: screenSize.width/5,right: screenSize.width/20),
                                    margin: EdgeInsets.only(bottom: screenSize.width/30),
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/coupon_bac.png",),fit: BoxFit.fill)),
                                    child:Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(width: screenSize.width/5,child: Text("Apple iTunes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: screenSize.width/20),),),
                                        SizedBox(width: screenSize.width/20),
                                        Container(width: screenSize.width/2.5,child:  Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("300 Cash Coupon",style: TextStyle(color: Colors.white,fontSize: screenSize.width/22),),
                                            Text("300 Cash Coupon",style: TextStyle(color: Colors.white,fontSize: screenSize.width/27),),
                                          ],),),
                                        SizedBox(width: screenSize.width/40),
                                        Icon(Icons.arrow_forward_ios,color: Colors.white,size: screenSize.width/20,)
                                      ],
                                    )
                                ), ),


                              ],
                            ),))
                  );

                },
              );
            }
        ));
  }
}