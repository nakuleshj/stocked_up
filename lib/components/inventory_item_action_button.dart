import 'package:flutter/material.dart';
class InventoryItemActionButton extends StatelessWidget {
  InventoryItemActionButton({
    @required this.buttonText,
    @required this.icon
  });
  final String buttonText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
      padding: EdgeInsets.all(22.0),
      width: 150.0,
      height: 125.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(icon,color: Colors.deepPurpleAccent,size:35),
          SizedBox(height: 5,),
          Text(buttonText,style: TextStyle(fontSize:17)),
        ],
      ),
    ),);
  }
}