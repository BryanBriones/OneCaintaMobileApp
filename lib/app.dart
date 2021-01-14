import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onecaintamobileapp/screens/home.dart';
import 'package:onecaintamobileapp/screens/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:onecaintamobileapp/model/fbusermodel.dart';
import 'package:onecaintamobileapp/model/googleusermodel.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';

class App extends StatelessWidget{
  
  //FBDATA------------------------------------------------------------------
  Map<String, dynamic> _fbuserData;
  AccessToken _accessToken;
  FBUserModel fblogindetails;
  String fieldsToGet = "first_name,last_name,email,picture.width(200)";

  //GOOGLE DATA------------------------------------------------------------
      GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email'
      ],
    );

   GoogleSignInAccount _googleuserData;
   GoogleUserModel googlelogindetails;
  
  Future<List<dynamic>> _checkIfIsLoggedFBandGoogle() async {

    

    List<dynamic> fbgooglecred = [];
   final AccessToken accesstoken = await FacebookAuth.instance.isLogged;

      if( accesstoken != null)
      {
        final userData = await FacebookAuth.instance.getUserData(fields: fieldsToGet);
      _fbuserData = userData;

      }

      if(_fbuserData != null)
      {
                showToast("Checking your saved sign-ins...");
                 fblogindetails = FBUserModel.getUserProfileFB(_fbuserData);
                fbgooglecred.add(fblogindetails);
       }

      bool googleSignedIn =  await _googleSignIn.isSignedIn();
      
      if(googleSignedIn)
      {
          await _googleSignIn.signInSilently(suppressErrors: false).catchError((dynamic e){ print('$e'); });;
          _googleuserData = _googleSignIn.currentUser;

      }
      if (_googleuserData != null)
       {
              
                googlelogindetails =  new GoogleUserModel(displayName: _googleuserData.displayName, email: _googleuserData.email, id: _googleuserData.id, photoUrl: _googleuserData.photoUrl);
                      fbgooglecred.add(googlelogindetails);
      }

          if (fbgooglecred.length == 0)
          {
            fbgooglecred = null;
          }

   
    return fbgooglecred;

  }

  @override
  Widget build(BuildContext 
context) {
    
    return  MaterialApp(title: "One Cainta App",
             debugShowCheckedModeBanner: false,
             theme: ThemeData(textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme) ),
              home:FutureBuilder<List<dynamic>>(
                                              future: _checkIfIsLoggedFBandGoogle(),
                                              builder: (context, snapshot) {
                                                    if (snapshot.hasData) {

                                                      showToast("Signing with your credentials...");

                                                      for(var i =0; i < snapshot.data.length; i++)
                                                      {
                                                        
                                                          // if(snapshot.data[i] != null && snapshot.data[i] is FBUserModel) //FB CRED ``````````````````
                                                          // {
                                                          //   return Home(1, fblogindetails,null);
                                                          // } else
                                                          
                                                           if (snapshot.data[i] != null && snapshot.data[i] is GoogleUserModel) { //GOOGLE CRED
                                                            return Home(1,null, googlelogindetails);
                                                          }

                                                      }
                                                     
                                                    }
                                                    else  //NO LOGIN
                                                    {
                                                        return Login();

                                                    }

                                                    return Container(width: 0, height: 0,);
                                              }
              )
              

             );
  }


  
}