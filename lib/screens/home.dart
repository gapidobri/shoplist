import 'package:flutter/material.dart';
import 'package:shoplist/theme.dart';
import 'package:shoplist/widgets/shop.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State < Home > {

  List < Shop > shops = [];

  void showAddShop() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
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
                'Add shop',
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
                      setState(() {
                        shops.add(
                          Shop(
                            name: controller.text,
                          ),
                        );
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

  void showShopActions(Shop shop) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1, 0, 0, 0),
      items: [
        PopupMenuItem < int > (
          value: 0,
          child: Text('Delete'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...(shops.map((shop) => GestureDetector(
          child: shop,
          onLongPress: () => showShopActions(shop),
        )).toList()),
        FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          mini: true,
          backgroundColor: lightGrey,
          onPressed: showAddShop,
        ),
      ],
    );
  }
}