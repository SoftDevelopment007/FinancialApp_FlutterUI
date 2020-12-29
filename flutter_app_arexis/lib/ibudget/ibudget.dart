import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';
import 'ibudgetProvider.dart';

class ibudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ibudgetProvider>(
        create: (context) => ibudgetProvider(),
        child: Builder(
            builder: (context)
            {
              return  Consumer<ibudgetProvider>(
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