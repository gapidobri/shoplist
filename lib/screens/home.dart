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
                            key: GlobalKey(),
                            name: controller.text,
                            items: [],
                            onDelete: removeShop,
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

  void removeShop(Shop shop) {
    setState(() => shops.remove(shop));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...shops,
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