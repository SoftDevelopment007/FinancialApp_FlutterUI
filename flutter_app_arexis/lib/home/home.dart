import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import '../shared_preference.dart';
import 'homeProvider.dart';
class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return ChangeNotifierProvider<homeProvider>(
        create: (context) => homeProvider(),
        child: Builder(
        builder: (context)
    {
      return Consumer<homeProvider>(
          builder: (context, pageProvider,child){
            return Scaffold(
                backgroundColor: kBackgoundColor,
                body: Container(color: kBackgoundColor2,)
            );
          }
      );
    }
    ));
  }
}