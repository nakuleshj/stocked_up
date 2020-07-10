import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddStock extends StatefulWidget {
  AddStock({this.user});
  final FirebaseUser user;
  @override
  _AddStockState createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  final addProductFormKey = GlobalKey<FormState>();
  final _firestore = Firestore.instance;
  String enteredProductName,
      enteredRate,
      enteredIndividualQuantity,
      enteredProductLoc,
      totalStock,
      totalStockUnits = 'Units';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.clear,
              size: 30,
            )),
        title: Text('Add Stock', style: TextStyle(fontSize: 28)),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: addProductFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Product Stock details:',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left)),
              SizedBox(height: 30),
              TextFormField(
                onFieldSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
                textInputAction: TextInputAction.next,
                cursorColor: Colors.deepPurpleAccent,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'Product Name',
                    labelStyle: TextStyle(
                        fontSize: 20, color: Colors.deepPurpleAccent)),
                // ignore: missing_return
                validator: (ProductName) {
                  if (ProductName.isEmpty) return "This field cannot be empty";
                },
                onChanged: (value) {
                  enteredProductName = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
                textInputAction: TextInputAction.next,
                cursorColor: Colors.deepPurpleAccent,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'Rate',
                    labelStyle: TextStyle(
                        fontSize: 20, color: Colors.deepPurpleAccent)),
                // ignore: missing_return
                validator: (rate) {
                  if (rate.isEmpty) return "This field cannot be empty";
                },
                onChanged: (rate) {
                  enteredRate = rate;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onFieldSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
                textInputAction: TextInputAction.next,
                cursorColor: Colors.deepPurpleAccent,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    labelText: 'Stored stock location',
                    labelStyle: TextStyle(
                        fontSize: 20, color: Colors.deepPurpleAccent)),
                // ignore: missing_return
                validator: (ProductLoc) {
                  if (ProductLoc.isEmpty) return "This field cannot be empty";
                },
                onChanged: (value) {
                  enteredProductLoc = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).nextFocus();
                      },
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.deepPurpleAccent,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: 'Total stock quantity',
                          labelStyle: TextStyle(
                              fontSize: 20, color: Colors.deepPurpleAccent)),
                      // ignore: missing_return
                      validator: (totalStock) {
                        if (totalStock.isEmpty)
                          return "This field cannot be empty";
                      },
                      onChanged: (qty) {
                        totalStock = qty;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton<String>(
                      value: totalStockUnits,
                      iconSize: 24,
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 20,
                      ),
                      underline: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          totalStockUnits = newValue;
                        });
                      },
                      items: <String>['Units', 'Kgs.']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              OutlineButton(
                onPressed: () {
                  if (addProductFormKey.currentState.validate())
                    _firestore
                        .collection('Inventory')
                        .document(widget.user.uid)
                        .collection('Items')
                        .add({
                      'productName': enteredProductName,
                      'productLocation': enteredProductLoc,
                      'rate': enteredRate,
                      'stockQuantity': '${totalStock + ' ' + totalStockUnits}'
                    });
                },
                color: Colors.white,
                highlightedBorderColor: Colors.deepPurpleAccent,
                borderSide: BorderSide(color: Colors.deepPurpleAccent),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                highlightColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
                  child: Text(
                    'Add Stock',
                    style:
                        TextStyle(color: Colors.deepPurpleAccent, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
