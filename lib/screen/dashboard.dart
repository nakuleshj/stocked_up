import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stocked_up/components/inventory_item_action_button.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final firestore = Firestore.instance;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title:Text('Inventory',style: TextStyle(fontSize:22),),
        actions: <Widget>[
          Padding(
            padding:EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: (){},
              child: Icon(Icons.search,size: 30,)),
          )
        ],
      ),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(vertical:8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children:[SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: 
            Row(
              children: <Widget>[
                InventoryItemActionButton(buttonText: 'Add item',icon: Icons.add_circle,),
                InventoryItemActionButton(buttonText: 'Update item',icon: Icons.edit,),
                InventoryItemActionButton(buttonText: 'View items',icon: Icons.list),
              ],
            ),),]
        ),
      ),),
    );
  }
}

