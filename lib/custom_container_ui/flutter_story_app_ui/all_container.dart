import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_all/custom_container_ui/flutter_story_app_ui/data.dart';

final cardAspectRatio = 12.0 / 22.0;
final widgetAspectRatio = cardAspectRatio * 1.2;

class AllContainer extends StatelessWidget {
  final padding = 20.0;
  final verticalInset = 20.0;
  final double currentPage;
  List<Widget> cardList = [];

  AllContainer(this.currentPage);

  void addWidget(contraints) {
    final width = contraints.maxWidth;
    final height = contraints.maxHeight;
    final safeWidth = width - 2 * padding;
    final safeHeight = height - 2 * padding;
    final heightOfPrimaryCard = safeHeight;
    final widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

    var primaryCardLeft = safeWidth - widthOfPrimaryCard;
    var horizontalInset = primaryCardLeft / 2;

    for (int i = 0; i < images.length; i++) {
      final delta = i - currentPage;
      final isOnRight = delta > 0;
      final start = padding +
          max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1),
              0.0);
      final cardItem = Positioned.directional(
        top: padding + verticalInset * max(-delta, 0.0),
        bottom: padding + verticalInset * max(-delta, 0.0),
        start: start,
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            child: AspectRatio(
              aspectRatio: cardAspectRatio,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(images[i], fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text(title[i]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      cardList.add(cardItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: AspectRatio(
        aspectRatio: widgetAspectRatio,
        child: LayoutBuilder(
          builder: (ctx, constraint) {
            addWidget(constraint);
            return Stack(
              children: cardList,
            );
          },
        ),
      ),
    );
  }
}
