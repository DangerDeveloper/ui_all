import 'package:flutter/material.dart';
import 'package:ui_all/custom_container_ui/flutter_story_app_ui/all_container.dart';
import 'package:ui_all/custom_container_ui/flutter_story_app_ui/data.dart';

class MainPageContainer extends StatefulWidget {
  @override
  _MainPageContainerState createState() => _MainPageContainerState();
}

class _MainPageContainerState extends State<MainPageContainer> {
  double pageIndex = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
        initialPage: images.length - 1);
    pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Custum Container'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            AllContainer(pageIndex),
            Positioned.fill(
              child: PageView.builder(
                itemBuilder: (context,int) => Container(),
                itemCount: images.length,
                controller: pageController,
                reverse: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
