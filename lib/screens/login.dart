
//Flutter Material 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:expandable/expandable.dart';
import 'package:ez_flutter/ez_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';



//Models
import 'package:onecaintamobileapp/model/fbusermodel.dart';
import 'package:onecaintamobileapp/model/googleusermodel.dart';

//Components
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:onecaintamobileapp/utility/loadingscreen.dart';
//Screens
import 'package:onecaintamobileapp/screens/home.dart';
import 'package:onecaintamobileapp/screens/otpVerify.dart';




//import 'package:flutter_brand_icons/flutter_brand_icons.dart';

class Login extends StatefulWidget{
 @override
_LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>{

//FBDATA--------------------------------------------------------------------------------------------------------
  Map<String, dynamic> _fbuserData;
  AccessToken _accessToken;
  FBUserModel fblogindetails;
  String fieldsToGet = "first_name,last_name,email,picture.width(200)";

//GOOGLE DATA---------------------------------------------------------------------------------------------------
      GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email'
      ],
    );

   GoogleSignInAccount _googleuserData;
   GoogleUserModel googlelogindetails;

//OTP DATA -----------------------------------------------------------------------------------------------------
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'PH';
  PhoneNumber number = PhoneNumber(isoCode: 'PH');
  String userphonenumber;

    void goToNews() async
    {


       EzLoadingBloc bloc =EzBlocProvider.of<EzGlobalBloc>(context).get(EzLoadingBloc);

        for (int i = 0; i < 101; i++) {
           bloc.addition.add("Loading $i%");
         await new Future.delayed(const Duration(milliseconds: 15));
        }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                         return Home(1, null,null,null);}));

    }

  void _fblogin() async {

     EzLoadingBloc bloc =
        EzBlocProvider.of<EzGlobalBloc>(context).get(EzLoadingBloc);

        try {
       
                  bloc.addition.add("Loading 10%");

                  _accessToken = await FacebookAuth.instance.login(); 
                    bloc.addition.add("Loading 20%");

                  final userData = await FacebookAuth.instance.getUserData(fields: fieldsToGet);
                  _fbuserData = userData;
                  bloc.addition.add("Loading 30%");

                    bloc.addition.add("Loading 50%");
                  fblogindetails = FBUserModel.getUserProfileFB(_fbuserData);
        
                 if (fblogindetails != null)
                 {
                    bloc.addition.add("Loading 90%");
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                     {return Home(1, fblogindetails, null, null);}),(Route<dynamic> route) => false);
                 }
        } catch (e) {

         showToast("Login failed, please try again.");
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                  {return Login();}),(Route<dynamic> route) => false);
        } 
  }

//GOOGLE SIGN IN----------------------------------------------------------------------------------------------------------------
  Future<void> _googlelogin() async {

       EzLoadingBloc bloc =
        EzBlocProvider.of<EzGlobalBloc>(context).get(EzLoadingBloc);

          try {
        
              bloc.addition.add("Loading 20%");
            await _googleSignIn.signIn();

          _googleuserData = _googleSignIn.currentUser;
            bloc.addition.add("Loading 50%");
          googlelogindetails =  new GoogleUserModel(displayName: _googleuserData.displayName, email: _googleuserData.email, id: _googleuserData.id, photoUrl: _googleuserData.photoUrl);
              bloc.addition.add("Loading 70%");

            if(googlelogindetails != null)
            {
                    bloc.addition.add("Loading 100%");

                          
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                          {return Home(1, null, googlelogindetails, null);}),(Route<dynamic> route) => false);
            }
        

          } catch (err)  {
            print(err);
            showToast("Login failed, please try again.");
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                        {return Login();}),(Route<dynamic> route) => false);
          }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
          resizeToAvoidBottomInset: false,   
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
                            height:80.0,
                            width: 290.0,
                            child: FittedBox( child:FloatingActionButton.extended(
                                                elevation: 40.0,
                                                icon: Icon(Icons.chevron_right,color: Colors.white.withOpacity(0.9),),
                                                label:  Text("Mga Balita sa Cainta Ngayon", style: TextStyle(color: Colors.white.withOpacity(0.9))),
                                                backgroundColor: Colors.blue[500],
                                                onPressed: ()
                                                {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => EzTransition(LoadingScreen(),
                                                                goToNews,
                                                                backgroundColor: Colors.white)),
                                                      );

                                                
                                                }     
                                            
                          ))),
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
                                                                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * .13)),
                                                                          Container(width: 80, height:80, 
                                                                                  decoration: new BoxDecoration(
                                                                                    image: new DecorationImage(
                                                                                     
                                                                                      image: new AssetImage("assets/caintalogo.png"),
                                                                                      fit: BoxFit.cover,
                                                                                    ),)),       
                                                                        Center(child:Text("One Cainta", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue[900]),)),
                                                                      
                                                                        Padding( padding: EdgeInsets.only(top:55), child:SizedBox(width: 225, height:50,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(BrandIcons.facebook, color: Colors.white),    
                                                                                            Padding(padding: EdgeInsets.only(left:10)),Text("Log in by Facebook", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                                                                        
                                                                                                    if(_fbuserData == null)
                                                                                                    {
                                                                                                                                                                             
                                                                                                     Navigator.push(
                                                                                                                context,
                                                                                                                MaterialPageRoute(
                                                                                                                    builder: (context) => EzTransition(LoadingScreen(),
                                                                                                                        _fblogin,
                                                                                                                        backgroundColor: Colors.white)),
                                                                                                              );
                                                                                                    }
                                                                                         
                                                                                        },))),
                                                                         Padding(padding: EdgeInsets.only(top:15)),
                                                                         SizedBox(width: 225, height:50,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(BrandIcons.google, color: Colors.white),   
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Log in by Google", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                            
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                  
                                                                                                if(_googleuserData == null)
                                                                                                    {
                                                                                                                                                                             
                                                                                                     Navigator.push(
                                                                                                                context,
                                                                                                                MaterialPageRoute(
                                                                                                                    builder: (context) => EzTransition(LoadingScreen(),
                                                                                                                        _googlelogin,
                                                                                                                        backgroundColor: Colors.white)),
                                                                                                              );
                                                                                                    }
                                                                                         
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
                                                                                        child: Padding( padding: EdgeInsets.only(top:30), child: SizedBox(width: 225, height:50,  child: Container(color: Colors.blue[500],
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
                                                                                   Padding(padding: EdgeInsets.fromLTRB(20,0,20,20), child: InternationalPhoneNumberInput(
                                                                                      onInputChanged: (PhoneNumber number) {
                                                                                        print(number.phoneNumber);
                                                                                        userphonenumber = number.phoneNumber;
                                                                                      },
                                                                                      onInputValidated: (bool value) {
                                                                                        print(value);
                                                                                      },
                                                                                      selectorConfig: SelectorConfig(
                                                                                        selectorType: PhoneInputSelectorType.DIALOG,
                                                                                      ),
                                                                                       ignoreBlank: false,
                                                                                      selectorTextStyle: TextStyle(color: Colors.black),
                                                                                      initialValue: number,
                                                                                       textFieldController: controller,
                                                                                       formatInput: false,
                                                                                       maxLength: 10,
                                                                                       keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                                                                      inputBorder: OutlineInputBorder(),
                                                                                     
                                                                                    ),),
                                                                           SizedBox(width: 225, height:40,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(Icons.phone, color: Colors.white),    
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Send OTP", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                            
                                                                                          ],
                                                                                        ), onPressed: (){ 

                                                                                             Navigator.push(context, MaterialPageRoute(builder: (_) 
                                                                                                {return OTPVerify(userphonenumber);}));
                           
                                                                                        },)),
                                                                                  ExpandableButton(       // <-- Collapses when tapped on
                                                                                    child: Padding(padding: EdgeInsets.only(top:20), child:Text(" << Back", style: TextStyle(color: Colors.black.withOpacity(.60), fontWeight: FontWeight.bold),)),
                                                                                  )
                                                             
                                                                        ])
                                                                         ),

                                                                    Column(children: [
                                                                          Padding(padding: EdgeInsets.only(bottom:15),),
                                                                        Center( child:(Text("By continuing, you agree to our", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900].withOpacity(0.8), fontSize: 11))
                                                                           ),
                                                                        ),
                                                                  
                                                                      GestureDetector(child: Text("Terms of Service - Privacy Policy - Content Policy", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: Colors.blue[900].withOpacity(0.8), fontSize: 11)),
                                                                              
                                                                             )


                                                                    ],)
                                   
                                                                           
                                                                         


                                                                        


        ])) 
                                                            
                                                                ])
                                                            )
                                                            ])
),
);
                                          

  }



}
