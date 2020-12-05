import 'package:flutter/material.dart';

class Item extends StatefulWidget {

  final String name;
  final int amount;
  final Color backgroundColor, textColor;

  Item({
    @required this.name,
    this.amount,
    this.backgroundColor,
    this.textColor,
  });

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State < Item > {
  @override
  Widget build(BuildContext context) {

    int amount = widget.amount ?? 0;
    Color textColor = widget.textColor ?? Colors.white;
    Color backgroundColor = widget.backgroundColor ?? Theme.of(context).accentColor;

    List < Widget > chipList = [
      Chip(
        label: Text(
          widget.name,
          style: TextStyle(
            color: textColor
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    ];

    if (amount > 0)
      chipList.insert(0, Chip(
        label: Text(
          '${widget.name}     $amount',
          style: TextStyle(
            color: textColor
          ),
        ),
        backgroundColor: backgroundColor.withOpacity(0.5),
      ));

    return Stack(
      children: chipList,
    );
  }
}