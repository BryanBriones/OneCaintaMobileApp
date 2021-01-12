import 'dart:convert';

//Flutter Material 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:expandable/expandable.dart';

//Models
import 'package:onecaintamobileapp/model/fbusermodel.dart';

//Components
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
//Screens
import 'package:onecaintamobileapp/screens/home.dart';




//import 'package:flutter_brand_icons/flutter_brand_icons.dart';

class Login extends StatefulWidget{
 @override
_LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>{
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'PH';
  PhoneNumber number = PhoneNumber(isoCode: 'PH');

  //FBDATA
  Map<String, dynamic> _userData;
  AccessToken _accessToken;
  FBUserModel logindetails;
  bool _checking = true;
  String fieldsToGet = "first_name,last_name,email,picture.width(200)";

  @override
  void initState() { 

     super.initState();
    _checkIfIsLogged();
  }
    Future<void> _checkIfIsLogged() async {

    final AccessToken accessToken = await FacebookAuth.instance.isLogged;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      print("is Logged:::: ${accessToken.toJson()}");
  
      // now you can call GetUserData.
      final userData = await FacebookAuth.instance.getUserData(fields: fieldsToGet);
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
         logindetails = FBUserModel.getUserProfileFB(_userData);
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                                 return Home(1, logindetails);}));
      });
    }
  }

  void _printCredentials() {
    print(
      _accessToken.toJson(),
    );
  }

  Future<void> _login() async {
    try {
      // show a circular progress indicator
      setState(() {
        _checking = true;
      });
         if (_accessToken == null) {
      _accessToken = await FacebookAuth.instance.login(); 
      _printCredentials();

      // get the user data
      final userData = await FacebookAuth.instance.getUserData(fields: fieldsToGet);
      _userData = userData;
         }
    } on FacebookAuthException catch (e) {
      // if the facebook login fails
      print(e.message); // print the error message in console
      // check the error type
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          showToast("Previous login operation in progress.");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
           showToast("Login cancelled.");
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          showToast("Login failed, please try again.");
          break;
      }
    } catch (e, s) {
      print(e);
      print(s);
    } finally {
      setState(() {
        _checking = false;
           print("Login successful");
            logindetails = FBUserModel.getUserProfileFB(_userData);
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                           return Home(1, logindetails);}));
      });
    }
  }



   
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
          resizeToAvoidBottomInset: false,   
          floatingActionButton:  FloatingActionButton.extended(
                            elevation: 40.0,

                            icon: Icon(Icons.chevron_right,color: Colors.white.withOpacity(0.9),),
                             label:  Text("Mga Balita", style: TextStyle(color: Colors.white.withOpacity(0.9))),
                            backgroundColor: Colors.blue[500],
                            onPressed: ()
                            {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                                 return Home(1, logindetails);}));
                            }     
                        
                          ),
                body:Container( height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                child:  
                                       Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children:[
                                                              Expanded(
                                                                  flex: 6,
                                                                   child:
                                                                   Column(
                                                                       children: <Widget>[
                                                                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * .10)),
                                                                          Container(width: 80, height:80, 
                                                                                  decoration: new BoxDecoration(
                                                                                    image: new DecorationImage(
                                                                                     
                                                                                      image: new AssetImage("assets/caintalogo.png"),
                                                                                      fit: BoxFit.cover,
                                                                                    ),)),       
                                                                        Center(child:Text("One Cainta", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue[900]),)),
                                                                      
                                                                        Padding( padding: EdgeInsets.only(top:55), child:SizedBox(width: 210, height:50,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(BrandIcons.facebook, color: Colors.white),    
                                                                                            Padding(padding: EdgeInsets.only(left:10)),Text("Log in by Facebook", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                                                                        
                                                                                                    if(_userData == null)
                                                                                                    {
                                                                                                      _login();
                                                                                                    }
                                                                                         
                                                                                        },))),
                                                                         Padding(padding: EdgeInsets.only(top:15)),
                                                                         SizedBox(width: 210, height:50,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(BrandIcons.google, color: Colors.white),   
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Log in by Google", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                            
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                                                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                              //    return Register('Supplier');}));
                                                                                        
                                                                                         
                                                                                        },)),

                                                                        ]),
                                                                       ),
                                                            Expanded(
                                                                   flex: 4,
                                                                   child:
                                                                   Column(
                                                                          
                                                                     children: <Widget>[
                                                                       
                                                                      Row(
                                                                      children: <Widget>[
                                                                          Expanded(
                                                                            child: Divider( color: Colors.grey, thickness: 0.5,)
                                                                          ),       
                                                                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10) , child: Text("OR", style: TextStyle(color: Colors.blue[500]),)),        
                                                                          Expanded(
                                                                              child: Divider( color: Colors.grey, thickness: 0.5,)
                                                                          ),
                                                                      ]
                                                                      ),    
                                                                        ExpandableNotifier(  // <-- Provides ExpandableController to its children
                                                                        child: Column(
                                                                          children: [
                                                                            Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
                                                                                      collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
                                                                                        child: Padding( padding: EdgeInsets.only(top:30), child: SizedBox(width: 210, height:50,  child: Container(color: Colors.blue[500],
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(Icons.phone, color: Colors.white),    //Icon(Icons.person_pin, size:30, color: Colors.white),
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Login by OTP", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                          ],
                                                                                        ) 
                                                                                        )
                                                                                        )
                                                                                        ),
                                                                                      ),
                                                                              expanded: Column(  
                                                                                children: [
                                                                                   Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * .05,0,MediaQuery.of(context).size.height * .05,20), child: InternationalPhoneNumberInput(
                                                                                      onInputChanged: (PhoneNumber number) {
                                                                                        print(number.phoneNumber);
                                                                                      },
                                                                                      onInputValidated: (bool value) {
                                                                                        print(value);
                                                                                      },
                                                                                      selectorConfig: SelectorConfig(
                                                                                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                                                                      ),
                                                                                       ignoreBlank: false,
                                                                                      autoValidateMode: AutovalidateMode.disabled,
                                                                                      selectorTextStyle: TextStyle(color: Colors.black),
                                                                                      initialValue: number,
                                                                                       textFieldController: controller,
                                                                                       formatInput: false,
                                                                                       maxLength: 10,
                                                                                       keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                                                                      inputBorder: OutlineInputBorder(),
                                                                                      onSaved: (PhoneNumber number) {
                                                                                        print('On Saved: $number');
                                                                                      },
                                                                                    ),),
                                                                           SizedBox(width: 210, height:40,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(Icons.phone, color: Colors.white),    
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Send OTP", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                            
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                                                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                              //    return Register('Supplier');}));
                                                                                         
                                                                                        },)),
                                                                                  ExpandableButton(       // <-- Collapses when tapped on
                                                                                    child: Padding(padding: EdgeInsets.only(top:20), child:Text(" << Back", style: TextStyle(color: Colors.black.withOpacity(.60), fontWeight: FontWeight.bold),)),
                                                                                  )
                                                             
                                                                        ])
                                                                         )


        ])) 
                                                            
                                                                ])
                                                            )
                                                            ])
),
);
                                          

  }



}
