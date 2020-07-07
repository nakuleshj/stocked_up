import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
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
              OutlineButton(
                onPressed: (){},
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
