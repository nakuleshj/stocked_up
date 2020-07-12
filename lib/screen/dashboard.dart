import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:stocked_up/screen/add_stock.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stocked_up/screen/get_started.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _loading = true;
  final firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  @override
  void initState() {
    _auth.currentUser().then((value) => setState(() {
          loggedInUser = value;
          _loading = false;
        }));
    super.initState();
  }
   Future<void> editStockQuantity(String stock,String barcode) async {
      int stockQty,enteredStockQty;
      String units;
     stockQty=int.parse(stock.split(" ")[0]);
     units=stock.split(" ")[1];
    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Stock Quantity'),
        content: TextFormField(
          onChanged: (value){
            enteredStockQty=int.parse(value);
          },
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurpleAccent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurpleAccent),
            ),
          ),
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.number,
          cursorColor: Colors.deepPurpleAccent,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Add Stock',style: TextStyle(
                          color: Colors.deepPurpleAccent)),
            onPressed: () {
              firestore.collection("Inventory").document(loggedInUser.uid).collection('Items').document(barcode).updateData({'stockQuantity':'${enteredStockQty+stockQty} $units'}).then((value) => Navigator.of(context).pop());
            },
          ),
        ],
      );});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 185,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'add',
              elevation: 1,
              onPressed: () {
                FlutterBarcodeScanner.scanBarcode(
                        "#ff6666", "Cancel", true, ScanMode.BARCODE)
                    .then((value) {
                  String barcode = value;
                  firestore
                      .collection("Inventory")
                      .document(loggedInUser.uid)
                      .collection('Items')
                      .document(value)
                      .get()
                      .then((value) {
                    if (value.data == null)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddStock(
                                  user: loggedInUser, barcode: barcode)));
                    else
                      {
                        print(value.data);
                        editStockQuantity(value.data['stockQuantity'],barcode);
                        }
                  });
                });
              },
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  _auth.signOut().then((value) =>  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>GetStartedScreen()), (route) => false));
                },
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                )),
          )),
        ],
        title: Text(
          'StockedUp',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, fontFamily: 'Logo'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              color: Colors.deepPurpleAccent,
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    //search code here
                  },
                  textInputAction: TextInputAction.search,
                  cursorColor: Colors.deepPurpleAccent,
                  decoration: InputDecoration(
                      labelText: "Search Inventory...",
                      labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.deepPurpleAccent,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent))),
                ),
              ),
            ),
            Expanded(
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.deepPurpleAccent),
                    ))
                  : StreamBuilder<QuerySnapshot>(
                      stream: firestore
                          .collection('Inventory')
                          .document(loggedInUser.uid)
                          .collection('Items')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null)
                          return Center(
                              child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.deepPurpleAccent),
                          ));
                        final products = snapshot.data.documents;
                        List<ProductStockCard> productStockCards = [];
                        for (var product in products)
                          productStockCards.add(
                            ProductStockCard(
                              productName: product.data['productName'],
                              productLocation: product.data['productLocation'],
                              rate: product.data['rate'],
                              availableStock: product.data['stockQuantity'],
                            ),
                          );
                        return ListView(children: productStockCards);
                      }),
            )
          ]),
        ),
      ),
    );
  }
}

class ProductStockCard extends StatelessWidget {
  const ProductStockCard(
      {this.productName, this.productLocation, this.availableStock, this.rate});
  final String productName, productLocation, availableStock, rate;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$productName',
                style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent)),
            SizedBox(height: 5),
            Text("Location: $productLocation", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Available Stock: $availableStock',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text("Rate: ₹$rate", style: TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
}
