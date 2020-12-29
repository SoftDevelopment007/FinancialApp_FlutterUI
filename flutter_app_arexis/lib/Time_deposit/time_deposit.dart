import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/Credit_Card/linked.dart';
import 'package:flutter_app_arexis/Credit_Card/unlinked.dart';
import 'package:flutter_app_arexis/Credit_Card/unlinked_areix.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetatil.dart';
import 'package:flutter_app_arexis/Time_deposit/deposit.dart';
import 'package:flutter_app_arexis/Time_deposit/time_depositProvider.dart';
import 'package:flutter_app_arexis/models/time_deposit_list.dart';
import 'file:///C:/Users/admin/flutter_app_arexis/lib/Filter/filter.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetail.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';


class time_deposit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return ChangeNotifierProvider<time_depositProvider>(
        create: (context) => time_depositProvider(),
        child: Builder(
            builder: (context)
            {
              return Consumer<time_depositProvider>(
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
                      body: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            pageProvider.loading();
                            return ;
                          },

                          child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(bottom: screenSize.width/30),
                            decoration: BoxDecoration(color: kBackgoundColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left:  screenSize.width/15, bottom:  screenSize.width/30),
                                    child:Text("Time Deposit",style: TextStyle(fontWeight:FontWeight.bold,fontSize:  screenSize.width/13,color: Colors.white),)
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
                                FutureBuilder<List<time_deposit_list>>(
                                  future: pageProvider.gettimedeposit(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<time_deposit_list> timedepositlists = snapshot.data;
                                      final time_deposit_lists = <Widget>[];
                                      for(int i=0;i<(pageProvider.loading_num<timedepositlists.length?pageProvider.loading_num:timedepositlists.length);i++){

                                        time_deposit_lists.add(InkWell(onTap:(){
                                          StorageUtil.getInstance();
                                          StorageUtil.putString("detail_id",timedepositlists[i].product_id  );
                                          Navigator.push(context, MaterialPageRoute(builder:(context) => time_depositDetail()));
                                        },child:deposit(context,timedepositlists[i])));}

                                      // if(CreditCardlists.length>10){
                                      //   items.addAll(CreditCardlists.getRange(0, 9));
                                      // }
                                      // else{
                                      //   items.addAll(CreditCardlists);
                                      // }
                                      return SingleChildScrollView(scrollDirection: Axis.vertical,child: Column(
                                          children:time_deposit_lists
                                      ));
                                    } else if (snapshot.hasError) {
                                      return snapshot.error;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),

                              ],
                            ),)))
                  );

                },
              );
            }
        ));
  }
}