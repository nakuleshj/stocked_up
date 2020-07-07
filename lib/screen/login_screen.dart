import 'package:flutter/material.dart';
import 'signup_screen.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Hero(
                  tag: 'title',
                  child: Text('StockedUp',
                      style: TextStyle(
                          fontFamily: 'Logo',
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Form(
                key:loginFormKey,
                              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(alignment:Alignment.centerLeft,child: Text('Login',style: TextStyle(color:Colors.deepPurpleAccent,fontWeight:FontWeight.bold,fontSize: 28),)),
                      SizedBox(height:18),
                      TextFormField(
                        cursorColor: Colors.deepPurpleAccent,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
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
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: 20, color: Colors.deepPurpleAccent)),
                                validator: (email){
                                  if(email.isEmpty)
                                    return "This field cannot be empty";
                                  else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
                                    return "Enter a valid Email";
                                },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.deepPurpleAccent,
                        obscureText: true,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
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
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 20, color: Colors.deepPurpleAccent)),
                                validator: (password){
                                  if(password.isEmpty)
                                    return "This field cannot be empty";
                                  else if(password.length<8)
                                    return "Invalid password";
                                },
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      OutlineButton(
                        onPressed: () {
                          if(loginFormKey.currentState.validate())
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        },
                        color: Colors.white,
                        highlightedBorderColor: Colors.deepPurpleAccent,
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        highlightColor: Colors.deepPurpleAccent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 18),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.deepPurpleAccent, fontSize: 22),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Don\'t have an account?'),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                              },
                                                        child: Text(
                                ' Sign up',
                                style: TextStyle(color: Colors.deepPurpleAccent),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
