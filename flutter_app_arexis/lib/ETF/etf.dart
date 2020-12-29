import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetatil.dart';
import 'file:///C:/Users/admin/flutter_app_arexis/lib/Filter/filter.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'etfProvider.dart';
import 'package:intl/intl.dart';
class etf extends StatelessWidget {
  final dateFormatter = DateFormat('hh:mm dd MMMM');
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return ChangeNotifierProvider<etfProvider>(
        create: (context) => etfProvider(),
        child: Builder(
            builder: (context)
            {
              return Consumer<etfProvider>(
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
                      body:
                      NotificationListener<OverscrollIndicatorNotification>(
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
                                        child:Text("ETF",style: TextStyle(fontWeight:FontWeight.bold,fontSize:  screenSize.width/13,color: Colors.white),)
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
                                    FutureBuilder(
                                      future: pageProvider.getetf(context),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          final etfs=snapshot.data;///////////////////////////////////////////////////////////////////////////////
                                          final etfs_widgets=<Widget>[];
                                          for(int i=0;i<(pageProvider.loading_num<etfs.length?pageProvider.loading_num:etfs.length);i++){
                                            etfs_widgets.add(
                                              InkWell(onTap:(){
                                                StorageUtil.getInstance();
                                                StorageUtil.putString("detail_id",etfs[i]['product_id']);
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => etfDetail(),));
                                              },child: Container(
                                                  width: screenSize.width,
                                                  margin: EdgeInsets.only(bottom: screenSize.width/30),
                                                  padding: EdgeInsets.all(screenSize.width/30,),
                                                  decoration: BoxDecoration(
                                                    color: kBackgoundColor8,
                                                  ),
                                                  child:Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [

                                                      Container(
                                                          width:screenSize.width/3.5 ,
                                                          child:Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(etfs[i]['etf_code']??'',overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(color: Colors.white,fontSize: screenSize.width/16)),
                                                              SizedBox(height:screenSize.width/90 ,),
                                                              Text(etfs[i]['etf_name']??'',overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(color: Colors.white,fontSize: screenSize.width/30)),
                                                            ],
                                                          )),

                                                      Container(width:screenSize.width/3.5,child: Image.asset("assets/graph1.png",fit: BoxFit.fitWidth,),),

                                                      SizedBox(width:screenSize.width/60),
                                                      Container(width: screenSize.width/3,child: Column(

                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(etfs[i]['etf_price'].toString(),overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize: screenSize.width/15, color: Colors.white),),
                                                          SizedBox(height: screenSize.width/90),
                                                          Row( mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              Image.asset("assets/arrow.png",height: screenSize.width/50,),
                                                              SizedBox(width: screenSize.width/90,),
                                                              Text("${etfs[i]['etf_price_change']}(${etfs[i]['etf_price_change']}%)",overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontSize:screenSize.width/30,color: Colors.red),)
                                                            ],
                                                          ),
                                                          SizedBox(height: screenSize.width/90),
                                                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                                                            Text( etfs[i]['etf_last_updated']??'',style: TextStyle(color: Colors.grey,fontSize: screenSize.width/40),)
                                                          ],)
                                                        ],
                                                      ) )

                                                    ],
                                                  )
                                              ), ),
                                            );
                                          }
                                          return Column(
                                            children:etfs_widgets
                                          );
                                        } else if (snapshot.hasError) {
                                          return snapshot.error;
                                        }
                                        return Container(
                                            child: Center(child: CircularProgressIndicator(),)
                                        );
                                      },
                                    ),

                                  ],
                                ),) ))



                  );

                },
              );
            }
        ));
  }
}