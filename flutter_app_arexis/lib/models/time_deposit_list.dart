
import 'dart:collection';
import 'package:flutter/foundation.dart';
class time_deposit_list {
  final String  bank_name, currency, period_type, product_id, product_name;
  final double rate,deposit_min;

  var period;

  time_deposit_list({
    @required this.bank_name,
    @required this.currency,
    @required this.period_type,
    @required this.product_id,
    @required this.product_name,
    @required this.deposit_min,
    @required this.rate,
    @required this.period,
  });

  factory time_deposit_list.fromJson(Map<String, dynamic> json) {
    return time_deposit_list(
      bank_name: json['bank_name'],
      currency: json['currency'],
      period_type: json['period_type'],
      product_id: json['product_id'],
      product_name: json['product_name'],
      deposit_min: json['deposit_min'],
      rate: json['rate'],
      period: json['period'],
    );
  }
}



class time_deposit_marketplace {
   final String  bank_name, currency, period_type, product_id, product_name;
   final double rate;
   final int deposit_min;
   var period;

  time_deposit_marketplace({
    @required this.bank_name,
    @required this.currency,
    @required this.period_type,
    @required this.product_id,
    @required this.product_name,
    @required this.deposit_min,
    @required this.rate,
    @required this.period,
  });

  factory time_deposit_marketplace.fromJson(Map<String, dynamic> json) {
    return time_deposit_marketplace(
      bank_name: json['bank_name'],
      currency: json['currency'],
      period_type: json['period_type'],
      product_id: json['product_id'],
      product_name: json['product_name'],
      deposit_min: json['deposit_min'],
      rate: json['rate'],
      period: json['period'],
    );
  }
}


