import 'package:flutter/material.dart';

class HappyMonster extends StatefulWidget {
  @override
  _HappyMonsterState createState() => _HappyMonsterState();
}

class _HappyMonsterState extends State<HappyMonster> {
  int currentPage = 0;
  PageController pageController;
  double pageControllerPage = 0.0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.1,
    );
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      setState(() {
        pageControllerPage = pageController.page;
        currentPage = pageControllerPage.toInt();
      });
    });
    final dWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 280,
            width: dWeidth,
            child: PageView.builder(
              controller: pageController,
              physics: BouncingScrollPhysics(),
              itemCount: 100,
              itemBuilder: (ctx, index) {
                double offsetY = (pageControllerPage - index).abs() * 20;
                return Transform.translate(
                  offset: Offset(0, -offsetY),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 280,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                            fontSize: 40,
                            color: currentPage == index
                                ? Colors.deepOrange
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
