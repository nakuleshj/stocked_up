import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
            Expanded(child: ListView(
              children: <Widget>[
                Card(child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text('Product Name',style:TextStyle(fontSize:20,color: Colors.deepPurpleAccent)),
                    SizedBox(height:5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Location: shelf123",style:TextStyle(fontSize:16)),
                        Text('Available Stock',style:TextStyle(fontSize:16))
                      ],
                    ),
                    SizedBox(height:5),
                    Text("Rate: ₹00.00",style:TextStyle(fontSize:16))
                  ],),
                ),),
              ],
            )
            // StreamBuilder<QuerySnapshot>(
            //   stream: firestore.collection('Inventory').document(loggedInUser.uid).collection('Items').snapshots(),
            //   builder: (context,snapshot){
            //   final products=snapshot.data.documents;
            //   if(snapshot==null)
            //     return null;
            //   List<Card> productStock=[];
            //   productStock.add(
            //     
            //   );
            // }),
            )
            ]
        ),
      ),),
    );
  }
}

