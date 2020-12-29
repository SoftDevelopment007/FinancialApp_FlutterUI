import 'dart:convert';
import 'package:flutter_app_arexis/models/credit_card_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/models/time_deposit_list.dart';

class marketplaceProvider extends ChangeNotifier{

  Future getdata(BuildContext context) async {
    var screenSize=MediaQuery.of(context).size;
    const String url = 'https://15d1fp48yg.execute-api.us-east-1.amazonaws.com/dev/marketplace/en/69904d92-b1f1-11ea-81a7-0a7a347b3dd5';
    try {
      var response = await http.get(Uri.encodeFull(url));
      var convertDataToJson = jsonDecode(response.body);
      return convertDataToJson['data'];
    } catch (e) {
      print(e);
      throw Padding(
        padding: EdgeInsets.only(top: screenSize.width/8),
        child: Center(
          child: Text('Marketplace is not available',style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),
        ),
      );
    }
  }
}