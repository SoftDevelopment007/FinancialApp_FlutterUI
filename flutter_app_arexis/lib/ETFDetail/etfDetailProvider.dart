import 'dart:convert';
import '../shared_preference.dart';
import 'package:flutter/material.dart';
import 'addtochart.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class etfDetailProvider extends ChangeNotifier{
  etfDetailProvider() {
    setup();
  }
  String product_id;
  void setup() async {
    StorageUtil.getInstance();
    product_id=StorageUtil.getString('detail_id');
  }

  double low=167.93;
double high=237.47;
double todayPrice=183.37;
String period="1 WK";
bool flag=false;
void click_expand(){
  flag=!(flag);notifyListeners();
}

int risk=4;
int etf_return=3;
bool sel_HSI=true;
void inverse_HSI_SP500(){
  sel_HSI=!(sel_HSI);notifyListeners();
}
double sum=0;
void put_sum(double value){
  sum=value;notifyListeners();
}
double edit1=0;
void edit1_change(double value){
  edit1=value;notifyListeners();
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
  edit4=value;;notifyListeners();
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
  edit7=value;;notifyListeners();
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// put chart data
  List<SalesData> chartData = [];
  double final_sum;
  int final_day=0;
  DateTime first_range_date=DateTime.now();
  DateTime data_first_range_date=DateTime.now();
  void put_chartData(etf_detail) async{
    chartData.clear();
    final List<SalesData> chartData_middle = [];
    var final_day_middle=0;
    Map<String,dynamic> mom=etf_detail['mom'];
    double sum=0;
    first_range_date=new DateTime(DateTime.parse(mom.keys.last).year,DateTime.parse(mom.keys.last).month,DateTime.parse(mom.keys.last).day-period_day);
    if(first_range_date.isBefore(DateTime.parse(mom.keys.first))){data_first_range_date=DateTime.parse(mom.keys.first);}else{data_first_range_date=first_range_date;}
    for (String key in mom.keys){
      if(DateTime.parse(key).isAfter(first_range_date)){final_day_middle+=1;sum+=mom[key]['mom'];
      chartData_middle.add(SalesData(DateTime.parse(key),sum));}
    }
    chartData=chartData_middle;
    final_sum=sum;
    final_day=final_day_middle;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int period_day=7;
  void putPeriod(String value){
    period=value; if(value=='1 WK'){period_day=7;}else if(value=='1 M'){period_day=30;}else if(value=='3 M'){period_day=90;}else if(value=='6 M'){period_day=180;}else if(value=='1 YR'){period_day=365;}else if(value=='3 YR'){period_day=1095;}else if(value=='5 YR'){period_day=1825;}else if(value=='10 YR'){period_day=3650;}else{period_day=10000;}notifyListeners();
  }

  String risk_string;
  String etf_return_string;
Future get_etfdetail(BuildContext context) async {
  var screenSize=MediaQuery.of(context).size;
  String url = 'https://15d1fp48yg.execute-api.us-east-1.amazonaws.com/dev/etf/$product_id';
  try {
    var response = await http.get(Uri.encodeFull(url));
    var convertDataToJson = jsonDecode(response.body);
    todayPrice=convertDataToJson['data']['etf_price'];
    low=convertDataToJson['data']['wk52l']==null?0:double.parse(convertDataToJson['data']['wk52l'])>todayPrice?todayPrice:double.parse(convertDataToJson['data']['wk52l']);
    high=convertDataToJson['data']['wk52h']==null?convertDataToJson['data']['etf_price']:double.parse(convertDataToJson['data']['wk52h'])<convertDataToJson['data']['etf_price']?convertDataToJson['data']['etf_price']:double.parse(convertDataToJson['data']['wk52h']);
    risk_string=period_day<1096?convertDataToJson['data']['etf_risk']['3yrs']:period_day<1826?convertDataToJson['data']['etf_risk']['5yrs']:convertDataToJson['data']['etf_risk']['10yrs'];
    risk=risk_string=='High'?5:risk_string=='Above Average'?4:risk_string=='Average'?3:risk_string=='Below Average'?2:risk_string=='Low'?1:1;
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    etf_return_string=period_day<1096?convertDataToJson['data']['etf_return']['3yrs']:period_day<1826?convertDataToJson['data']['etf_return']['5yrs']:convertDataToJson['data']['etf_return']['10yrs'];
    etf_return=etf_return_string=='High'?5:etf_return_string=='Above Average'?4:etf_return_string=='Average'?3:etf_return_string=='Below Average'?2:etf_return_string=='Low'?1:1;
    return (convertDataToJson['data']);
  } catch (e) {
    print(e);
    throw Padding(
      padding: EdgeInsets.only(top: screenSize.height/8),
      child: Center(
        child: Text('ETF is not available',style: TextStyle(color: Colors.white,fontSize: screenSize.width/20),),
      ),
    );
  }
}


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
Map<String, double> dataMap = {
  "stock": 3,
  "bond": 1,
 };


int addhsi=boxaddhsi;
int addhs=boxaddhs;
int putchart(value){
  if(value==1 || value==3){addhsi=value;}
  if(value==2 || value==4){addhs=value;}
  notifyListeners();
 return 1;
}

}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}