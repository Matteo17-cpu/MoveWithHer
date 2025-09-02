import 'dart:math';
import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:flutter/material.dart';

class CardStackDisplay extends StatelessWidget {
  const CardStackDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 32;
    const height = 150.0;

    const colors = [
      Colors.red,
      Colors.green,
      Colors.white,
      Colors.grey,
      Colors.yellow,
    ];

    final cards = List.generate(colors.length, (index) {
      return CardModel(
        key: Key("$index"),
        backgroundColor: colors[index],
        radius: const Radius.circular(12),
        shadowColor: Colors.black.withOpacity(0.2),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.topCenter,
          child: Text("$index"),
        ),
      );
    });

    return CardStackWidget(
      cardList: cards,
      alignment: Alignment.center,
      reverseOrder: true,
      cardDismissOrientation: CardOrientation.both,
      swipeOrientation: CardOrientation.both,
      opacityChangeOnDrag: true,
      animateCardScale: true,
      dismissedCardDuration: const Duration(milliseconds: 150),
      positionFactor: 0.3,
      scaleFactor: 0.9,
    );
  }
}
