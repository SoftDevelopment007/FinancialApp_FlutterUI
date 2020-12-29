import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetatil.dart';
import 'package:flutter_app_arexis/Time_deposit/time_deposit.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail.dart';
import 'package:flutter_app_arexis/time_depositDetail/time_depositDetail.dart';
import 'package:flutter_app_arexis/utils/color.dart';

Widget deposit(BuildContext context,time_deposit){
  var screenSize=MediaQuery.of(context).size;
  return   InkWell(onTap:(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => time_depositDetail(),));
  },child: Container(
      width: screenSize.width,
      margin: EdgeInsets.only(bottom: screenSize.width/30),
      padding: EdgeInsets.only(left:screenSize.width/30,right:screenSize.width/30,top:screenSize.width/20,bottom: screenSize.width/30 ),
      decoration: BoxDecoration(
        color: kBackgoundColor8,
      ),
      child:Row(

        children: [
          SizedBox(width: screenSize.width/30),
          Container(
              height:screenSize.width/7 ,
              width: screenSize.width/7,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenSize.width/14),image: DecorationImage(image:AssetImage("assets/bank.png"),fit: BoxFit.fill )),

          ),
          SizedBox(width: screenSize.width/20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenSize.width/2.5,
                child:Text(time_deposit.bank_name, overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
              ),
              Container(
                width: screenSize.width/1.5,
                child:Text(time_deposit.product_name, overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/27,color:Colors.white),),
              ),
              SizedBox(height: screenSize.width/72),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: screenSize.width/3.5,child:  Column(
                    children: [
                      Text("${(time_deposit.rate*100).toStringAsFixed(3)}%",style: TextStyle(fontSize: screenSize.width/13,color: kBackgoundColor4),),
                    ],
                  ), ),

                  Container(width: screenSize.width/10,child:  Column(
                    children: [
                      Text(time_deposit.period.toStringAsFixed(0),style: TextStyle(fontSize: screenSize.width/18,color: kBackgoundColor4),),
                      Text(time_deposit.period_type,style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                    ],
                  ), ),

                  Container(width: screenSize.width/3.5,child:  Column(
                    children: [
                      Text(time_deposit.deposit_min.toStringAsFixed(0),style: TextStyle(fontSize: screenSize.width/18,color: kBackgoundColor4),),
                      Text("Minimum deposit",style: TextStyle(fontSize: screenSize.width/40,color: kBackgoundColor4),)

                    ],
                  ),)

                ],
              )

            ],
          ),
        ],
      )
  ), );
}