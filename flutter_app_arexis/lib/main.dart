import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]).then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,fontFamily: 'Avenir'),
      home: main_page(),
    );
  }
}

