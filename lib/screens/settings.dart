import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(),
            TextField(),
            TextField(),
          ],
        ),
      ),
    );
  }
}