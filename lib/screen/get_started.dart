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
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text('StockedUp',style:TextStyle(fontFamily: 'Logo',color: Colors.white,fontSize: 55,fontWeight: FontWeight.bold)),
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
                        textStyle: TextStyle(fontSize: 28.0,color: Colors.white,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        ),
                  ),
                ],
              ),
            ),
              OutlineButton(
                onPressed: (){},
                color: Colors.green,
                //shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                highlightedBorderColor: Colors.white,
                highlightColor: Colors.green,
                borderSide: BorderSide(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:12.0,horizontal:16),
                  child: Text('Get Started',style: TextStyle(color: Colors.white,fontSize: 22),),
                ),
              )
          ],
        ),
      ),
    );
  }
}
