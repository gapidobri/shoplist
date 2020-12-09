import 'package:flutter/material.dart';

class Item extends StatefulWidget {

  final String name;
  final int amount;
  final Color backgroundColor, textColor;
  final Function(bool) onStateChange;

  bool bought = false;

  Item({
    Key key,
    this.name,
    this.amount,
    this.backgroundColor,
    this.textColor,
    this.onStateChange,
  }): super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State < Item > {

  void changeState() {
    setState(() => widget.bought = !widget.bought);
    widget.onStateChange(widget.bought);
  }

  @override
  Widget build(BuildContext context) {
    int amount = widget.amount ?? 0;
    Color textColor = widget.textColor ?? Colors.white;
    Color backgroundColor = widget.backgroundColor ?? Theme.of(context).accentColor;

    TextStyle normalTS = TextStyle(
      color: textColor,
    );

    TextStyle lineTroughTS = TextStyle(
      color: textColor,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 4,
      decorationColor: Colors.white.withAlpha(150),
    );

    List < ActionChip > chipList = [
      ActionChip(
        label: Text(
          widget.name,
          style: !widget.bought ? normalTS : lineTroughTS,
        ),
        backgroundColor: !widget.bought ? backgroundColor : backgroundColor.withAlpha(150),
        onPressed: changeState,
      ),
    ];

    if (amount > 1)
      chipList.insert(0, ActionChip(
        label: Text(
          '${widget.name}     $amount',
          style: TextStyle(
            color: textColor
          ),
        ),
        backgroundColor: backgroundColor.withOpacity(0.5),
        onPressed: changeState,
      ));

    return GestureDetector(
      child: Stack(
        children: chipList,
      ),
    );
  }
}