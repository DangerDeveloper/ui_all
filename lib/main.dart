import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:ui_all/styles.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ui_all/widgets/icon_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NASA X DEMO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundBg,
      bottomNavigationBar: _buildBottomNavigationButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              _topNavigationRow(),
              SizedBox(
                height: 120.0,
              ),
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  _buildMainCard(),
                  Positioned(
                    top: -170.0,
                    child: Image(
                      height: 320.0,
                      image: AssetImage('assets/one_plus.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _topNavigationRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildRoundedIconButton(Icons.arrow_back),
      _buildRoundedIconButton(Icons.shopping_cart),
    ],
  );
}

Widget _buildRoundedIconButton(IconData icon) {
  return Container(
    height: 50.0,
    width: 50.0,
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      boxShadow: softUiShadow,
      color: Color(0XFFE8F1F9),
      shape: BoxShape.circle,
      border: Border.all(
        width: 2.0,
        color: Color(0XFF9DB4D3),
      ),
    ),
    child: Center(
      child: Icon(
        icon,
        size: 24,
        color: Color(0Xff353151).withOpacity(.7),
      ),
    ),
  );
}

Widget _buildBottomNavigationButton() {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
    child: Container(
      height: 60.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey.shade200,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                '\$ 3,200',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: _preOrderButton(),
          ),
        ],
      ),
    ),
  );
}

Widget _preOrderButton() {
  return Container(
    height: 60.0,
    decoration: BoxDecoration(
      gradient: activeGradient,
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
          color: Colors.indigo[300],
          spreadRadius: 6.0,
          blurRadius: 15.0,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Pre-Order',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        VerticalDivider(
          color: Colors.red,
        ),
        Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 32.0,
        ),
      ],
    ),
  );
}

Widget _buildMainCard() {
  return ClipShadow(
    boxShadow: softUiShadow,
    clipper: RoundedDiagonalPathClipper(),
    child: Container(
      padding: EdgeInsets.all(16.0),
      height: 470.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.0),
        color: Color(0xffcddeec),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: _buildRoundedIconButton(Icons.favorite),
          ),
          _buildMainCardBottomDescription(),
        ],
      ),
    ),
  );
}

Widget _buildMainCardBottomDescription() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          CustomIconButton(
//            iconName: Icons.directions_walk,
//          ),
//        ],
        children: iconForBtns.map((item) {
          return CustomIconButton(
            iconName: item,
          );
        }).toList(),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        'NASA x ANICORN',
        style: TextStyle(
          fontSize: 42.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF353151),
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        'Luner Sample Return LE',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: Color(0xFF353151),
          wordSpacing: 4.0,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum....',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
    ],
  );
}
