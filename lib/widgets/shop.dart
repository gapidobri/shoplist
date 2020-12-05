import 'package:flutter/material.dart';
import 'package:shoplist/theme.dart';
import 'package:shoplist/widgets/item.dart';

class Shop extends StatefulWidget {

  final String name;
  final List < Item > items;

  const Shop({
    Key key,
    @required this.name,
    this.items,
  }): super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State < Shop > {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: lightGrey,
      margin: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: widget.items ?? [],
            ),
          ],
        ),
      ),
    );
  }
}