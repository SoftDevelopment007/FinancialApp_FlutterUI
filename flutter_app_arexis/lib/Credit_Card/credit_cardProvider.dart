import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/models/credit_card_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class credit_cardProvider extends ChangeNotifier{
  int loading_num=10;
  void loading(){
    loading_num+=10;notifyListeners();
  }
  Future<List<CreditCardlist>> getCreditCardlist(BuildContext context) async {
    var screenSize=MediaQuery.of(context).size;
    const String url = 'https://15d1fp48yg.execute-api.us-east-1.amazonaws.com/dev/creditcards/en/69904d92-b1f1-11ea-81a7-0a7a347b3dd5';
    try {
      var response = await http.get(Uri.encodeFull(url));
      var convertDataToJson = jsonDecode(response.body);
      return (convertDataToJson['data'] as List)
          .map((n) => CreditCardlist.fromJson(n))
          .toList();
    } catch (e) {
      print(e);
      throw Padding(
        padding: EdgeInsets.only(top: screenSize.width/8),
        child: Center(
          child: Text('Credit Card is not available',style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),
        ),
      );
    }
  }
}

