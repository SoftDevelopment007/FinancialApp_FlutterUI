import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/ETFDetail/etfDetatil.dart';
import 'package:flutter_app_arexis/credit_cardDetail/credit_cardDetail.dart';
import 'package:flutter_app_arexis/utils/color.dart';

Widget unlinked(BuildContext context){
  var screenSize=MediaQuery.of(context).size;
  return   InkWell(onTap:(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => credit_cardDetail(),));
  },child: Container(

      width: screenSize.width,
      margin: EdgeInsets.only(bottom: screenSize.width/30),
      padding: EdgeInsets.only(left:screenSize.width/30,right:screenSize.width/30,top: screenSize.width/20,bottom: screenSize.width/30 ),
      decoration: BoxDecoration(
        color: kBackgoundColor8,
      ),
      child:Row(

        children: [
          Stack(children: [
            Container(
              height:screenSize.width/8 ,
              width: screenSize.width/5.5,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenSize.width/30),color: Colors.white),
            ),
            Container(margin:EdgeInsets.only(left: screenSize.width/9.5,top:screenSize.width/20),height: screenSize.width/10,width: screenSize.width/10,decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(screenSize.width/20)),
            child:Image.asset("assets/add_account.png",fit: BoxFit.fill,)),
          ],),

          SizedBox(width: screenSize.width/20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenSize.width/2.5,
                child:Text("Citi Bank", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/40,color:Colors.white),),
              ),
              Container(
                width: screenSize.width/1.5,
                child:Text("Citi Cash Bank credit card", overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight:FontWeight.bold,fontSize:screenSize.width/22,color:Colors.white),),
              ),
              SizedBox(height: screenSize.width/72),
             Container(width: screenSize.width/1.5,child: Text("You might want to link your bank account for personalised experience.",style: TextStyle(fontSize:screenSize.width/36,color:kBackgoundColor4),),)

            ],
          )
        ],
      )
  ), );
}