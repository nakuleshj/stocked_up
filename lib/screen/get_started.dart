import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:stocked_up/screen/dashboard.dart';
import 'package:stocked_up/screen/login_screen.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  FirebaseUser loggedInUser;
  FirebaseAuth _auth=FirebaseAuth.instance;
  bool _loading=true;
  @override
  void initState() {
    _auth.currentUser().then((value) {
      if(value!=null)
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Dashboard()), (route) => false);
      else
      setState(() {
        _loading=false;
      });
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text('StockedUp',style:TextStyle(fontFamily: 'Logo',fontSize: 55,fontWeight: FontWeight.bold,color:Colors.white)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: FadeAnimatedTextKit(
                      isRepeatingAnimation: true,
                      repeatForever: true,
                        text: [
                          "Manage Inventory",
                          "Manage Shipments",
                          "Get Insights",
                        ],
                        textStyle: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold,color:Colors.white),
                        textAlign: TextAlign.center,
                        ),
                  ),
                ],
              ),
            ),
              _loading?CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),):OutlineButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>LoginScreen()), (route) => false);
                },
                color: Colors.white,
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(color:Colors.white),
                shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                highlightColor: Colors.deepPurpleAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:12.0,horizontal:18),
                  child: Text('Get Started',style: TextStyle(color: Colors.white,fontSize: 25),),
                ),
              )
          ],
        ),
      ),
    );
  }
}
