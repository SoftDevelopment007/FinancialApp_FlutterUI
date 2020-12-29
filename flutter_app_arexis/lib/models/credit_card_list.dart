
import 'dart:collection';
import 'package:flutter/foundation.dart';
class CreditCardlist {
 final String  bank_name,imgURL,product_id,product_name,reward_type;
 final double min_income,min_age,earned_mile,saved_amount;
  CreditCardlist({
    @required this.bank_name,
    @required this.earned_mile,
    @required this.imgURL,
    @required this.min_age,
    @required this.min_income,
    @required this.product_id,
    @required this.product_name,
    @required this.reward_type,
    @required this.saved_amount,
  });

  factory CreditCardlist.fromJson(Map<String, dynamic> json) {
    return CreditCardlist(
      bank_name: json['bank_name'],
      earned_mile: json['earned_mile'],
      imgURL: json['imgURL'],
      min_age: json['min_age'],
      min_income: json['min_income'],
      product_id: json['product_id'].toString(),
      product_name: json['product_name'].toString(),
      reward_type: json['product_id'].toString(),
      saved_amount: json['saved_amount'],
    );
  }
}

class CreditCardlist_marketplace {
  final String  bank_name,imgURL,product_id,product_name,reward_type;
  final double earned_mile,saved_amount;
  final int min_income, min_age;
  CreditCardlist_marketplace({
    @required this.bank_name,
    @required this.earned_mile,
    @required this.imgURL,
    @required this.min_age,
    @required this.min_income,
    @required this.product_id,
    @required this.product_name,
    @required this.reward_type,
    @required this.saved_amount,
  });

  factory CreditCardlist_marketplace.fromJson(Map<String, dynamic> json) {
    return CreditCardlist_marketplace(
      bank_name: json['bank_name'],
      earned_mile: json['earned_mile'],
      imgURL: json['imgURL'],
      min_age: json['min_age'],
      min_income: json['min_income'],
      product_id: json['product_id'].toString(),
      product_name: json['product_name'].toString(),
      reward_type: json['product_id'].toString(),
      saved_amount: json['saved_amount'],
    );
  }
}


