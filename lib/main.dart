import 'package:flutter/material.dart';
import 'package:ui_all/styles.dart';

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
                height: 100.0,
              )
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
          Flexible(flex: 3, fit: FlexFit.tight, child: _preOrderButton()),
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
  );
}
