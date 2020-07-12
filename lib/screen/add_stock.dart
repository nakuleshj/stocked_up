import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddStock extends StatefulWidget {
  AddStock({this.user,this.barcode});
  final FirebaseUser user;
  final String barcode;
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
  List<String> productSearch=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: Center(
            child: SingleChildScrollView(
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
                  SizedBox(height: 40),
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
                    validator: (productName) {
                      if (productName.isEmpty) return "This field cannot be empty";
                      return null;
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
                    validator: (productLoc) {
                      if (productLoc.isEmpty) return "This field cannot be empty";
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
                      String temp='';
                      if (addProductFormKey.currentState.validate())
                        {
                          for(var character in enteredProductName.toLowerCase().split(""))
                            {
                            temp+=character;
                            productSearch.add(temp);
                            }
                          _firestore
                            .collection('Inventory')
                            .document(widget.user.uid)
                            .collection('Items')
                            .document(widget.barcode)
                            .setData({
                          'productName': enteredProductName,
                          'productLocation': enteredProductLoc,
                          'rate': enteredRate,
                          'stockQuantity': '${totalStock + ' ' + totalStockUnits}',
                          'searchIndex':productSearch
                        }).then((value) => Navigator.pop(context));}
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
          ),
        ),
      )),
    );
  }
}
