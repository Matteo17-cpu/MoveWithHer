import 'package:flutter/material.dart';
import 'package:card_stack_widget/card_stack_widget.dart';

class CardChangeWidget extends StatefulWidget {
  const CardChangeWidget({super.key});

  @override
  CardChangeWidgetState createState() => CardChangeWidgetState();
}

class CardChangeWidgetState extends State<CardChangeWidget> {
  bool _cardScaleAnimation = false;
  bool _opacityChangeOnDrag = false;
  bool _reverseOrder = false;
  double _positionFactorValue = 0.3;
  double _scaleFactorValue = 1;
  int _dismissedValue = 150;
  Radius _radius = const Radius.circular(16.0);

  CardOrientation? _cardDismissOrientationValue;
  CardOrientation? _swipeOrientation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // FIXED HEIGHT to avoid layout error
      child: CardStackWidget(
        opacityChangeOnDrag: _opacityChangeOnDrag,
        animateCardScale: _cardScaleAnimation,
        dismissedCardDuration: Duration(milliseconds: _dismissedValue),
        positionFactor: _positionFactorValue,
        scaleFactor: _scaleFactorValue,
        onCardTap: (model) => debugPrint('on card tap -> $model'),
        cardList: _buildMockListCard(),
        alignment: Alignment.center,
        reverseOrder: _reverseOrder,
        cardDismissOrientation: _cardDismissOrientationValue,
        swipeOrientation: _swipeOrientation,
      ),
    );
  }

  List<CardModel> _buildMockListCard() {
    final width = MediaQuery.of(context).size.width - 32;
    const height = 150.0;

    const colors = [
      Colors.red,
      Colors.green,
      Colors.white,
      Colors.grey,
      Colors.yellow,
    ];

    var list = <CardModel>[];
    for (int index = 0; index < colors.length; index++) {
      var color = colors[index];

      list.add(
        CardModel(
          key: Key("$index"),
          backgroundColor: color,
          radius: _radius,
          shadowColor: Colors.black.withOpacity(0.2),
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.topCenter,
            child: Text("$index"),
          ),
        ),
      );
    }

    return list;
  }
}
