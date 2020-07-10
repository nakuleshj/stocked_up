import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stocked_up/components/inventory_item_action_button.dart';
import 'package:stocked_up/screen/add_stock.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final firestore = Firestore.instance;
  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  @override
  void initState() {
    _auth.currentUser().then((value) => loggedInUser=value);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FloatingActionButton(elevation: 15,onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStock(user:loggedInUser)));
        },child:
            Icon(Icons.add,size: 35,),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        title:Text('StockedUp',style: TextStyle(fontSize:35,fontWeight: FontWeight.bold,fontFamily: 'Logo'),),
       
      ),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(vertical:0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children:[
              Container(
                color: Colors.deepPurpleAccent,
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  onFieldSubmitted: (value){
                    //search code here
                  },
                  textInputAction: TextInputAction.search,
                  cursorColor: Colors.deepPurpleAccent,
                  decoration: InputDecoration(
                    labelText: "Search Inventory...",
                    labelStyle: TextStyle(color:Colors.deepPurpleAccent),
        prefixIcon: Icon(Icons.search,color: Colors.deepPurpleAccent,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:Colors.deepPurpleAccent)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:Colors.deepPurpleAccent)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:Colors.deepPurpleAccent)
        )
          ),
                ),
              ),
            ),
            Expanded(child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('Inventory').document(loggedInUser.uid).collection('Items').snapshots(),
              builder: (context,snapshot){
              final products=snapshot.data.documents;
              if(snapshot==null)
                return null;
              List<ListTile> productStock=[];
              productStock.add(
                ListTile()
              );
            }),)
            ]
        ),
      ),),
    );
  }
}

