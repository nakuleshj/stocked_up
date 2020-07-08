import 'package:flutter/material.dart';
import 'package:stocked_up/screen/get_started.dart';
void main() {
  runApp(StockedUp());
}
class StockedUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor:Colors.deepPurpleAccent),
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
    );
  }
}