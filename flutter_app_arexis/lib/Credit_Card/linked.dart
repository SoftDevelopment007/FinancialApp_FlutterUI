import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetatil.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail.dart';
import 'package:flutter_app_arexis/models/credit_card_list.dart';
import 'package:flutter_app_arexis/utils/color.dart';

Widget linked(BuildContext context,CreditCardlist creditCardlist){
  var screenSize=MediaQuery.of(context).size;
  return  Container(

      width: screenSize.width,
      margin: EdgeInsets.only(bottom: screenSize.width/30),
      padding: EdgeInsets.only(left:screenSize.width/30,right:screenSize.width/30,top:screenSize.width/20,bottom: screenSize.width/30 ),
      decoration: BoxDecoration(
        color: kBackgoundColor8,
      ),
      child:Row(

        children: [
          Container(
              height:screenSize.width/8 ,
              width: screenSize.width/5.5,
              child: Image.network(creditCardlist.imgURL,fit: BoxFit.cover,)
          ),
          SizedBox(width: screenSize.width/20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenSize.width/2.5,
                child:Text(creditCardlist.bank_name, overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
              ),
              Container(
                width: screenSize.width/1.5,
                child:Text(creditCardlist.product_name, overflow: TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/22,color:Colors.white),),
              ),
              SizedBox(height: screenSize.width/72),
              Row(children: [
                Text("+\$${creditCardlist.saved_amount.toStringAsFixed(2)}",style: TextStyle(fontSize:screenSize.width/16,color:kBackgoundColor4),),
                SizedBox(width: screenSize.width/30,),
                Column(
                  children: [
                    SizedBox(height: screenSize.width/70,),
                    Text("Saved money",style: TextStyle(fontSize:screenSize.width/30,color:kBackgoundColor4),),
                  ],
                )

              ],)

            ],
          )
        ],
      )
  );
}