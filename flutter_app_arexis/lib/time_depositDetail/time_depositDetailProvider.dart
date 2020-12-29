import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../shared_preference.dart';

class time_depositDetailProvider extends ChangeNotifier{

  time_depositDetailProvider() {
    setup();
  }
  String product_id;

  void setup() async {
    StorageUtil.getInstance();
    product_id=StorageUtil.getString('detail_id');
  }

  List<bool> peer_open=List.filled(100, false);
  void change_peer_open(int i){
    peer_open[i]=!peer_open[i];notifyListeners();
  }
  Future get_timeDepositdetail(BuildContext context) async {
    var screenSize=MediaQuery.of(context).size;
    String url = 'https://15d1fp48yg.execute-api.us-east-1.amazonaws.com/dev/termdeposit/en/69904d92-b1f1-11ea-81a7-0a7a347b3dd5/$product_id';
    try {
      var response = await http.get(Uri.encodeFull(url));
      var convertDataToJson = jsonDecode(response.body);
      return (convertDataToJson['data']);
    } catch (e) {
      print(e);
      throw Padding(
        padding: EdgeInsets.only(top: screenSize.height/8),
        child: Center(
          child: Text('Credit Card is not available',style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),
        ),
      );
    }
  }
double deposit=0;
void deposit_change(double value){
  deposit=value;notifyListeners();
}
double period=0;
void period_change(double value){
  period=value;notifyListeners();
}
String period_selection="1 WK";
void putPeriod(String value){
  period_selection=value; notifyListeners();
}
double sum=0;
void put_sum(double value){
  sum=value;notifyListeners();
}
double edit1=0;
void edit1_change(double value){
  edit1=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
double edit2=0;
void edit2_change(double value){
  edit2=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
double edit3=0;
void edit3_change(double value){
  edit3=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
double edit4=0;
void edit4_change(double value){
  edit4=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
double edit5=0;
void edit5_change(double value){
  edit5=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
double edit6=0;
void edit6_change(double value){
  edit6=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
double edit7=0;
void edit7_change(double value){
  edit7=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
double edit8=0;
void edit8_change(double value){
  edit8=value;sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8;notifyListeners();
}
CrossFadeState change=CrossFadeState.showFirst;
void return_change(){
  if(change==CrossFadeState.showFirst){change=CrossFadeState.showSecond;}else{change=CrossFadeState.showFirst;}
  notifyListeners();
}

  double invest=0; double dinning=0;double home=0;double financial=0;double shopping=0;double transportation=0;double leisure=0;double healthcare=0;double others=0;
  void put_edit_value(value){
    invest=value[0];dinning=value[1]; home=value[2];financial=value[3];shopping=value[4];transportation=value[5];leisure=value[6];healthcare=value[7];others=value[8];notifyListeners();
  }

final List<SalesData> chartData = [
  SalesData(DateTime(2010,DateTime.january,1), 165.55),
  SalesData(DateTime(2011,DateTime.january,1), 195.25),
  SalesData(DateTime(2012,DateTime.january,1), 200.65),
  SalesData(DateTime(2013,DateTime.january,1), 180.55),
  SalesData(DateTime(2014,DateTime.january,1), 195.25),
  SalesData(DateTime(2015,DateTime.january,1), 200.65),
  SalesData(DateTime(2016,DateTime.january,1), 180.55),
  SalesData(DateTime(2017,DateTime.january,1), 195.25),
  SalesData(DateTime(2018,DateTime.january,1), 200.65),
  SalesData(DateTime(2019,DateTime.january,1), 195.25),
  SalesData(DateTime(2020,DateTime.january,1), 200.65),
];
final List<SalesData> chartData_return_HSI = [
  SalesData(DateTime(2010,DateTime.january,1), 165.55),
  SalesData(DateTime(2011,DateTime.january,1), 195.25),
  SalesData(DateTime(2012,DateTime.january,1), 200.65),
  SalesData(DateTime(2013,DateTime.january,1), 180.55),
  SalesData(DateTime(2014,DateTime.january,1), 195.25),
  SalesData(DateTime(2015,DateTime.january,1), 200.65),
  SalesData(DateTime(2016,DateTime.january,1), 180.55),
  SalesData(DateTime(2017,DateTime.january,1), 195.25),
  SalesData(DateTime(2018,DateTime.january,1), 200.65),
  SalesData(DateTime(2019,DateTime.january,1), 195.25),
  SalesData(DateTime(2020,DateTime.january,1), 200.65),
];
final List<SalesData> chartData_return_SP = [
  SalesData(DateTime(2010,DateTime.january,1), 175.55),
  SalesData(DateTime(2011,DateTime.january,1), 185.25),
  SalesData(DateTime(2012,DateTime.january,1), 210.65),
  SalesData(DateTime(2013,DateTime.january,1), 160.55),
  SalesData(DateTime(2014,DateTime.january,1), 185.25),
  SalesData(DateTime(2015,DateTime.january,1), 190.65),
  SalesData(DateTime(2016,DateTime.january,1), 185.55),
  SalesData(DateTime(2017,DateTime.january,1), 185.25),
  SalesData(DateTime(2018,DateTime.january,1), 160.65),
  SalesData(DateTime(2019,DateTime.january,1), 175.25),
  SalesData(DateTime(2020,DateTime.january,1), 180.65),
];
bool flag=false;
void click_expand(){
  flag=!(flag);notifyListeners();
}

}class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}