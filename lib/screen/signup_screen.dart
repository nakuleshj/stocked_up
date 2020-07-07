import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signupFormKey=GlobalKey<FormState>();
  String enteredPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:100.0),
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
                Form(
                  key:signupFormKey,
                                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(alignment:Alignment.centerLeft,child: Text('Create an Account',style: TextStyle(color:Colors.deepPurpleAccent,fontWeight:FontWeight.bold,fontSize: 28),)),
                          SizedBox(height:18),
                          TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).nextFocus();
                            },
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.deepPurpleAccent,
                            decoration:InputDecoration(
                                border:OutlineInputBorder(
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
                                hintStyle:TextStyle(color: Colors.grey[800]),
                                labelText: 'Business Name',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.deepPurpleAccent)),
                                    validator: (businessName){
                                      if(businessName.isEmpty)
                                        return  "This field cannot be empty";
                                    },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).nextFocus();
                            },
                            
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.deepPurpleAccent,
                            decoration:InputDecoration(
                                border:OutlineInputBorder(
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
                                hintStyle:TextStyle(color: Colors.grey[800]),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.deepPurpleAccent)),
                                validator: (email){
                                      if(email.isEmpty)
                                        return  "This field can't be empty";
                                      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
                                        return "Enter a valid Email";
                                    }
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                              flex:1,
                                child: TextFormField(
                                enabled: false,
                              cursorColor: Colors.deepPurpleAccent,
                              decoration:InputDecoration(
                                  border:OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurpleAccent),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
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
                                  hintStyle:TextStyle(color: Colors.grey[800]),
                                  labelText: '+91',
                                  labelStyle: TextStyle(
                                      fontSize: 20, color: Colors.deepPurpleAccent)),
                          ),
                            ),
                            SizedBox(width: 10),
                          Expanded(
                            flex:4,
                                  child: TextFormField(
                                    onFieldSubmitted: (value){
                              FocusScope.of(context).nextFocus();
                            },
                            textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                              cursorColor: Colors.deepPurpleAccent,
                              decoration:InputDecoration(
                                  border:OutlineInputBorder(
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
                                  hintStyle:TextStyle(color: Colors.grey[800]),
                                  labelText: 'Mobile Number',
                                  labelStyle: TextStyle(
                                      fontSize: 20, color: Colors.deepPurpleAccent)),
                                      validator: (mobNo){
                                        if(mobNo.isEmpty)
                                          return "This field can't be empty";
                                        else if(mobNo.length<10)
                                          return "Enter a valid 10 digit number";
                                      },
                            ),
                          ),
                          ],),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).nextFocus();
                            },
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.deepPurpleAccent,
                            obscureText: true,
                            decoration:InputDecoration(
                                border:OutlineInputBorder(
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
                                hintStyle:TextStyle(color: Colors.grey[800]),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.deepPurpleAccent)),
                                  validator: (password){
                                  if(password.isEmpty)
                                    return "This field cannot be empty";
                                  else if(password.length<8)
                                    return "Password must be atleast 8 characters";
                                  else
                                    enteredPassword=password;
                                },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.deepPurpleAccent,
                            obscureText: true,
                            onFieldSubmitted: (value){
                              FocusScope.of(context).nextFocus();
                            },
                            decoration:InputDecoration(
                                border:OutlineInputBorder(
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
                                hintStyle:TextStyle(color: Colors.grey[800]),
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.deepPurpleAccent)),
                                     validator: (confirmPassword){
                                  if(confirmPassword.isEmpty)
                                    return "This field cannot be empty";
                                  else if(confirmPassword!=enteredPassword)
                                    return "Passwords don't match";
                                },
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          OutlineButton(
                            onPressed: () {
                              if(signupFormKey.currentState.validate())
                                print("Form is valid");
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                                      //builder: (context) => LoginScreen()),
                                  // (route) => false);
                            },
                            color: Colors.white,
                            highlightedBorderColor: Colors.deepPurpleAccent,
                            borderSide: BorderSide(color: Colors.deepPurpleAccent),
                            shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            highlightColor: Colors.deepPurpleAccent,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 18),
                              child: Text(
                                'Sign Up',
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
                                Text('Already have an account?'),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                  },
                                   child: Text(
                                    ' Login',
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
        ),
      ),
    );
  }
}