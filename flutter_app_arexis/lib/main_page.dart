import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_arexis/main_page_Provider.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'account/account.dart';
import 'home/home.dart';
import 'ibudget/ibudget.dart';
import 'marketplace/marketplace.dart';


class main_page extends StatefulWidget {
  @override
  _main_page createState() => _main_page();
}
class _main_page extends State<main_page>  with SingleTickerProviderStateMixin{
  int bottomIndex=0;
  List<Widget> _tabList = [home(), account(), ibudget(),marketplace()];
  TabController _tabController;
  int tabIndex=0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: _tabList.length,
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {
   var screenSize=MediaQuery.of(context).size;
   return ChangeNotifierProvider<main_page_Provider>(
       create: (context) => main_page_Provider(),
       child: Builder(
       builder: (context)
   {
     return Consumer<main_page_Provider>(
         builder: (context, pageProvider,child)
     {
       return Scaffold(
           resizeToAvoidBottomPadding: false,
           extendBody: true,
           appBar: AppBar(
             centerTitle: true,
             elevation: 0,
             automaticallyImplyLeading: false,
             title: Text(""),
             flexibleSpace: Container(
               decoration: BoxDecoration(color: kBackgoundColor),
             ),
             actions: [
               IconButton(
                   icon: Image.asset(
                     "assets/nav.png",
                     height: screenSize.width / 9,
                     width: screenSize.width / 14,
                   ),
                   onPressed: () {}),
               SizedBox(width: screenSize.width / 20)
             ],
           ),
           body: Container(
             color: Colors.white,
             height: screenSize.height,
             width: screenSize.width,
             child: TabBarView(
               children: _tabList,
               physics: NeverScrollableScrollPhysics(),
               controller: _tabController,
             ),
           ),
           bottomNavigationBar: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               CurvedNavigationBar(
                 color: Colors.white,
                 height: screenSize.width / 12,
                 backgroundColor: Colors.transparent,
                 animationCurve: Curves.decelerate,
                 // You can change Animation Here
                 buttonBackgroundColor: Colors.white,
                 items: <Widget>[
                   tabIndex != 0?Image.asset("assets/home.png",height: screenSize.width/12,):Image.asset("assets/home_selected.png",height: screenSize.width/12,),
                   tabIndex != 1?Image.asset("assets/account.png",height: screenSize.width/12,):Image.asset("assets/account_selected.png",height: screenSize.width/12),
                   tabIndex != 2? Image.asset("assets/ibudget.png",height: screenSize.width/12,):Image.asset("assets/ibudget_selected.png",height: screenSize.width/12,),
                   tabIndex != 3?Image.asset("assets/marketplace.png",height: screenSize.width/12,):Image.asset("assets/marketplace_selected.png",height: screenSize.width/12,),
                 ],
                 onTap: (index) {
                   setState(() {
                     _tabController.animateTo(index);
                     tabIndex = index;
                   });
                 },
               ),
               Container(height: screenSize.width / 10.5,
                 padding: EdgeInsets.only(top: screenSize.width / 40),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                          Container(width: screenSize.width / 4,
                         child: Center(child: Text("Home", style: TextStyle(
                             fontWeight: FontWeight.bold, fontSize: screenSize
                             .width / 30, color: tabIndex==0?kBackgoundColor37:kBackgoundColor)),))
                        ,

                         Container(width: screenSize.width / 4,
                         child: Center(child: Text("Account", style: TextStyle(
                             fontWeight: FontWeight.bold, fontSize: screenSize
                             .width / 30, color: tabIndex==1?kBackgoundColor37:kBackgoundColor)),))
                       ,
                   Container(width: screenSize.width / 4,
                         child: Center(child: Text("iBudget", style: TextStyle(
                             fontWeight: FontWeight.bold, fontSize: screenSize
                             .width / 30, color:tabIndex==2?kBackgoundColor37:kBackgoundColor)),))
                       ,
                    Container(width: screenSize.width / 4,
                         child: Center(child: Text("Marketplace",
                             style: TextStyle(fontWeight: FontWeight.bold,
                                 fontSize: screenSize.width / 30,
                                 color:tabIndex==3?kBackgoundColor37:kBackgoundColor)),)) ,
                   ],
                 ),)
             ],
           )

       );
     });}));
  }
}