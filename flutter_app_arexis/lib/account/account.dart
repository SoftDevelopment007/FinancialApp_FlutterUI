import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_arexis/shared_preference.dart';
import 'package:flutter_app_arexis/utils/color.dart';
import 'package:provider/provider.dart';

import 'accountProvider.dart';

class account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<accountProvider>(
        create: (context) => accountProvider(),
        child: Builder(
            builder: (context)
            {
              return Scaffold(
                  backgroundColor: kBackgoundColor,
                body: Container(color: kBackgoundColor1,)
              );
            }
        ));
  }
}