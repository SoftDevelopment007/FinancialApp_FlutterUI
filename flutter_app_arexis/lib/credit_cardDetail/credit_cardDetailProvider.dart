import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class credit_cardDetailProvider extends ChangeNotifier{
  credit_cardDetailProvider() {
    setup();
  }
 String product_id;

  void setup() async {
   StorageUtil.getInstance();
   product_id=StorageUtil.getString('detail_id');
}
  List<bool> select=List.filled(100, false);
void change_select(int i){
  select[i]=true;
}
  List<bool> peer_open=List.filled(100, false);
  void change_peer_open(int i){
    peer_open[i]=!peer_open[i];notifyListeners();
  }
double offer_max=0;
void add_offer_max(add){
  offer_max+=add;notifyListeners();
}
  Future getCreditCarddetail(BuildContext context) async {
    var screenSize=MediaQuery.of(context).size;
    String url = 'https://15d1fp48yg.execute-api.us-east-1.amazonaws.com/dev/creditcard/en/69904d92-b1f1-11ea-81a7-0a7a347b3dd5/$product_id';
    try {
      var response = await http.get(Uri.encodeFull(url));
      var convertDataToJson = jsonDecode(response.body);
      StorageUtil.putString('credit_description', convertDataToJson['data']['description']);
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
  double invest=0; double dinning=0;double home=0;double financial=0;double shopping=0;double transportation=0;double leisure=0;double healthcare=0;double others=0;
 void put_edit_value(value){
invest=value[0];dinning=value[1]; home=value[2];financial=value[3];shopping=value[4];transportation=value[5];leisure=value[6];healthcare=value[7];others=value[8];notifyListeners();
 }
  double low=167.93;
  double high=237.47;
  double todayPrice=183.37;
  String period="1 WK";
  int period_day=7;
  int risk=4;
  int etf_return=3;
  double sum=0;
  void put_sum(double value){
    sum=value;notifyListeners();
  }
  double edit1=0;
  void edit1_change(double value){
    edit1=value;notifyListeners();
  }
 double edit_sum;
  void get_edit_sum(double item){
  edit_sum=edit1+edit2+edit3+edit4+edit5+edit6+edit7+edit8-item;
  }
  double edit2=0;
  void edit2_change(double value){
    edit2=value;notifyListeners();
  }
  double edit3=0;
  void edit3_change(double value){
    edit3=value;notifyListeners();
  }
  double edit4=0;
  void edit4_change(double value){
    edit4=value;notifyListeners();
  }
  double edit5=0;
  void edit5_change(double value){
    edit5=value;notifyListeners();
  }
  double edit6=0;
  void edit6_change(double value){
    edit6=value;notifyListeners();
  }
  double edit7=0;
  void edit7_change(double value){
    edit7=value;notifyListeners();
  }
  double edit8=0;
  void edit8_change(double value){
    edit8=value;notifyListeners();
  }

  CrossFadeState change=CrossFadeState.showFirst;
  void return_change(){
   if(change==CrossFadeState.showFirst){change=CrossFadeState.showSecond;}else{change=CrossFadeState.showFirst;}
   notifyListeners();
  }
  void putPeriod(String value){
    period=value; if(value=='1 WK'){period_day=7;}else if(value=='1 M'){period_day=30;}else if(value=='3 M'){period_day=90;}else if(value=='6 M'){period_day=180;}else if(value=='1 YR'){period_day=365;}notifyListeners();
  }
  double final_sum;
  int final_day=0;
  DateTime first_range_date=DateTime.now();
  DateTime data_first_range_date=DateTime.now();
  void put_chartData(credit_card_detail) async{
    chartData.clear();
    final List<SalesData_credit> chartData_middle = [];
    var final_day_middle=0;
    Map<String,dynamic> dod=credit_card_detail['dod'];
    double sum=0;
    first_range_date=new DateTime(DateTime.parse(dod.keys.last).year,DateTime.parse(dod.keys.last).month,DateTime.parse(dod.keys.last).day-period_day);
    if(first_range_date.isBefore(DateTime.parse(dod.keys.first))){data_first_range_date=DateTime.parse(dod.keys.first);}else{data_first_range_date=first_range_date;}
    for (String key in dod.keys){
      if(DateTime.parse(key).isAfter(first_range_date)){final_day_middle+=1;sum+=dod[key]['Sum'];
      chartData_middle.add(SalesData_credit(DateTime.parse(key),sum));}
    }
    chartData=chartData_middle;
    final_sum=sum;
    final_day=final_day_middle;
  }
  double totalinvest=0;
  void get_totalinvest_put_chartData(credit_card_detail) async{
    Map<String,dynamic> dod=credit_card_detail['dod'];
    double sum=0;
    if(first_range_date.isBefore(DateTime.parse(dod.keys.first))){data_first_range_date=DateTime.parse(dod.keys.first);}else{data_first_range_date=first_range_date;}
    for (String key in dod.keys){
    sum+=dod[key]['Sum'];
      }
    totalinvest=sum;
  }

  List<SalesData_credit> chartData = [];
  final List<SalesData_credit> chartData_return_HSI = [
    SalesData_credit(DateTime(2010,DateTime.january,1), 165.55),
    SalesData_credit(DateTime(2011,DateTime.january,1), 195.25),
    SalesData_credit(DateTime(2012,DateTime.january,1), 200.65),
    SalesData_credit(DateTime(2013,DateTime.january,1), 180.55),
    SalesData_credit(DateTime(2014,DateTime.january,1), 195.25),
    SalesData_credit(DateTime(2015,DateTime.january,1), 200.65),
    SalesData_credit(DateTime(2016,DateTime.january,1), 180.55),
    SalesData_credit(DateTime(2017,DateTime.january,1), 195.25),
    SalesData_credit(DateTime(2018,DateTime.january,1), 200.65),
    SalesData_credit(DateTime(2019,DateTime.january,1), 195.25),
    SalesData_credit(DateTime(2020,DateTime.january,1), 200.65),
  ];
  final List<SalesData_credit> chartData_return_SP = [
    SalesData_credit(DateTime(2010,DateTime.january,1), 175.55),
    SalesData_credit(DateTime(2011,DateTime.january,1), 185.25),
    SalesData_credit(DateTime(2012,DateTime.january,1), 210.65),
    SalesData_credit(DateTime(2013,DateTime.january,1), 160.55),
    SalesData_credit(DateTime(2014,DateTime.january,1), 185.25),
    SalesData_credit(DateTime(2015,DateTime.january,1), 190.65),
    SalesData_credit(DateTime(2016,DateTime.january,1), 185.55),
    SalesData_credit(DateTime(2017,DateTime.january,1), 185.25),
    SalesData_credit(DateTime(2018,DateTime.january,1), 160.65),
    SalesData_credit(DateTime(2019,DateTime.january,1), 175.25),
    SalesData_credit(DateTime(2020,DateTime.january,1), 180.65),
  ];
  Map<String, double> dataMap = {
    "stock": 3,
    "bond": 1,
  };

bool flag=false;
void click_expand(){
  flag=!(flag);notifyListeners();
}

}

class SalesData_credit {
  SalesData_credit(this.year, this.sales);
  final DateTime year;
  final double sales;
}