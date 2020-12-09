import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:shoplist/theme.dart';
import 'package:shoplist/widgets/item.dart';

class Shop extends StatefulWidget {

  final GlobalKey key;
  final String name;
  final List < Item > items;
  final Function(Shop) onDelete;

  const Shop({
    @required this.name,
    this.items,
    this.key,
    this.onDelete,
  });

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State < Shop > {

  Future < void > showAddItem() async {
    TextEditingController controller = TextEditingController();
    Color pickedColor = Theme.of(context).accentColor;
    int amount = 1;
    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Dialog(
          backgroundColor: lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add item',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 20),
                SpinBox(
                  min: 1,
                  value: amount.toDouble(),
                  onChanged: (_amount) => amount = _amount.toInt(),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: MaterialColorPicker(
                    physics: NeverScrollableScrollPhysics(),
                    onColorChange: (color) => setState(() => pickedColor = color),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          setState(() {
                            widget.items.add(
                              Item(
                                name: controller.text,
                                amount: amount,
                                backgroundColor: pickedColor,
                                onStateChange: (bougth) => setState(() {}),
                              ),
                            );
                          });
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  void showShopActions() async {
    RenderBox box = widget.key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    int choice = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1, position.dy, 0, 0),
      items: [
        PopupMenuItem < int > (
          value: 0,
          child: Text('Delete'),
        ),
      ],
    );
    switch (choice) {
      case 0:
        widget.onDelete(widget);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    List < Item > notBoughtList = widget.items.where((item) => !item.bought).toList();
    List < Item > boughtList = widget.items.where((item) => item.bought).toList();

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
            Row(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: showShopActions,
                ),
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: [
                ...notBoughtList ?? [],
                IconButton(
                  icon: Icon(Icons.add),
                  splashRadius: 16,
                  onPressed: showAddItem,
                ),
                boughtList.isNotEmpty ? Divider() : Row(),
                ...boughtList ?? [],
              ],
            ),
          ],
        ),
      ),
    );
  }
}