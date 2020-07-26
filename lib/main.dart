import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'cradit_card_app/controllers/page_controller_app.dart';
import 'package:ui_all/cradit_card_app/pages/home_page.dart';
import './ecommers/mobileshopapp/main_page.dart';
import './ecommers/oneplus/one_plus.dart';
import './touch_intrection_with_pageview/happy_monster.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider(
        create: (ctx) => PageControllerApp(),
        child: HomePageCreditCard(),
      ),
    );
  }
}
