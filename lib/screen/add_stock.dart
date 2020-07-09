import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddStock extends StatefulWidget {
  @override
  _AddStockState createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  final addItemFormKey = GlobalKey<FormState>();
  String enteredItemName,
      enteredRate,
      enteredIndividualQuantity,
      individualQty,
      totalStock,
      individual,
      enteredIndividualQuantityUnits = "Units",
      totalStockUnits = 'Units';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon(Icons.clear),
        title: Text('Add Stock',style: TextStyle(fontSize: 30)),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: addItemFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(alignment:Alignment.centerLeft,child: Text('Stock details:',style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 28,fontWeight: FontWeight.bold),textAlign: TextAlign.left)),
              SizedBox(height:30),
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
                    labelText: 'Item Name',
                    labelStyle: TextStyle(
                        fontSize: 20, color: Colors.deepPurpleAccent)),
                // ignore: missing_return
                validator: (itemName) {
                  if (itemName.isEmpty) return "This field cannot be empty";
                },
                onChanged: (value) {
                  enteredItemName = value;
                },
              ),
              SizedBox(height:20),
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
              SizedBox(height:20),
              Row(
                children: <Widget>[
                  Expanded(
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
                          labelText: 'Individual item quantity',
                          labelStyle: TextStyle(
                              fontSize: 20, color: Colors.deepPurpleAccent)),
                      // ignore: missing_return
                      validator: (individualQuantity) {
                        if (individualQuantity.isEmpty)
                          return "This field cannot be empty";
                      },
                      onChanged: (qty) {
                        enteredIndividualQuantity = qty;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton<String>(
                      value: enteredIndividualQuantityUnits,
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
                          enteredIndividualQuantityUnits = newValue;
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
              SizedBox(height:20),
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
              SizedBox(height:50),
              OutlineButton(
                onPressed: () {
                  //if(addItemFormKey.currentState.validate())
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
