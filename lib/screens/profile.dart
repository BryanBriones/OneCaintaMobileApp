import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:onecaintamobileapp/screens/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Models
import 'package:onecaintamobileapp/model/fbusermodel.dart';
import 'package:onecaintamobileapp/model/googleusermodel.dart';
import 'package:onecaintamobileapp/model/otpusermodel.dart';

class UserProfile extends StatefulWidget {
  final FBUserModel fblogindetails;
  final GoogleUserModel googlelogindetails;
  final OTPUserModel otplogindetails;

  UserProfile(this.fblogindetails, this.googlelogindetails, this.otplogindetails);
 @override
 State<StatefulWidget> createState() {
    return _UserProfileState(this.fblogindetails, this.googlelogindetails, this.otplogindetails);
  }
}

class _UserProfileState extends State<UserProfile> with TickerProviderStateMixin{

  final FBUserModel fblogindetails;
  final GoogleUserModel googlelogindetails;
  final OTPUserModel otplogindetails;

  GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email'
      ],
    );


_UserProfileState(this.fblogindetails, this.googlelogindetails, this.otplogindetails);
bool IsRefresh = false;
bool isLoading = false;


showloadingscreen(BuildContext context)
   {
         
    AlertDialog alert=AlertDialog(
           backgroundColor: Colors.blue[900],
      content: new Row(
        children: [
          CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
          Container(margin: EdgeInsets.only(left: 30),child:Text("Loading..." , style: TextStyle(color:Colors.white),)),
        ],),
    );
    showDialog(barrierDismissible: false,

      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
   
   return alert;

   }

  refresh() async {

    setState(() {
        
        });
  }

  Future<void> _fblogOut() async {
  await FacebookAuth.instance.logOut();
  setState(() {
  showToast("Logging off...");
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                   {return Login();}),(Route<dynamic> route) => false);
  });
}

Future<void> _googlelogOut() async {
  await _googleSignIn.disconnect(); 

  setState(() {
  showToast("Logging off...");
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                   {return Login();}),(Route<dynamic> route) => false);
  });
}

Future<void> _normallogOut() async {

  setState(() {
  showToast("Logging off...");
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                   {return Login();}),(Route<dynamic> route) => false);
  });
}


  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "My Profile"),

                    body:Scrollbar(child:RefreshIndicator(
                    
                       child:  SingleChildScrollView(
                        child: Container(
                                           height: MediaQuery.of(context).size.height,
                                           child:Column(                  
                                                children:  [
                                                ListTile(
                                                      title:  fblogindetails != null ?  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child: fblogindetails == null ?  Text("Hello, User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])) :  Text("Hello, " +  fblogindetails.firstName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])))
                                                              : googlelogindetails != null ? Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child: googlelogindetails == null ?  Text("Hello, User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])) :  Text("Hello, " +  googlelogindetails.displayName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])))
                                                              : otplogindetails != null ? Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child: otplogindetails == null ?  Text("Hello, User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])) :  Text("Hello, " +  otplogindetails.fullname, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])))
                                                              : Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child: Text("Hello, User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900]))),
                                                      subtitle:  fblogindetails != null ? Padding(padding:EdgeInsets.all(5), child: fblogindetails == null ?  Text("Please sign in to unlock other One Cainta features", style: TextStyle(color: Colors.black.withOpacity(0.6))) : Text(fblogindetails.email,style: TextStyle(color: Colors.black.withOpacity(0.6)))) //Email Address
                                                              :  googlelogindetails != null ? Padding(padding:EdgeInsets.all(5), child: googlelogindetails == null ?  Text("Please sign in to unlock other One Cainta features", style: TextStyle(color: Colors.black.withOpacity(0.6))) : Text(googlelogindetails.email,style: TextStyle(color: Colors.black.withOpacity(0.6)))) 
                                                              :  otplogindetails != null ? Padding(padding:EdgeInsets.all(5), child: otplogindetails == null ?  Text("Please sign in to unlock other One Cainta features", style: TextStyle(color: Colors.black.withOpacity(0.6))) : Text(otplogindetails.email,style: TextStyle(color: Colors.black.withOpacity(0.6)))) 
                                                              :  Padding(padding:EdgeInsets.all(5), child: Text("Please sign in to unlock other One Cainta features", style: TextStyle(color: Colors.black.withOpacity(0.6)))),         
                                                      trailing: fblogindetails != null ? CircleAvatar(radius: 30.0,backgroundImage: fblogindetails == null ? AssetImage('assets/emptyavatar.png') : NetworkImage(fblogindetails.picture.data.url),backgroundColor: Colors.transparent)
                                                              : googlelogindetails != null ? CircleAvatar(radius: 30.0,backgroundImage: googlelogindetails == null ? AssetImage('assets/emptyavatar.png') : NetworkImage(googlelogindetails.photoUrl),backgroundColor: Colors.transparent)
                                                              : otplogindetails != null ?  CircleAvatar(radius: 30.0,backgroundImage: AssetImage('assets/emptyavatar.png') ,backgroundColor: Colors.transparent)
                                                              : CircleAvatar(radius: 30.0,backgroundImage: AssetImage('assets/emptyavatar.png'),backgroundColor: Colors.transparent)
                                                      ),
                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                                                 ButtonBar(
                                            alignment: MainAxisAlignment.spaceEvenly,
                                            buttonPadding: EdgeInsets.all(5),
                                            buttonMinWidth: 30,
                                            children: [ 
                                            
                                              InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child:FlatButton(
                                                      child: Column( children: [ Icon(Icons.person_rounded,color: Colors.blue[900]), Text("Personal Info", style: TextStyle(color: Colors.black))]),
                                                       onPressed: null) ,
                                                ),
                                              InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child:FlatButton(
                                                      child: Column( children: [ Icon(Icons.settings_rounded,color: Colors.blue[900]), Text("Settings", style: TextStyle(color: Colors.black),)]),
                                                      onPressed: null)
                                            ),
                                            ],
                                            ),
                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),

                                             InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.info_outline_rounded,color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("About", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                      onTap: null,)),
                                            ),
                                                InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.feedback_outlined,color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Send feedback", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                      onTap: null,)),
                                            ),
                                             InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.logout,color: Colors.black.withOpacity(0.6), ),
                                                      title:  fblogindetails == null  &&  googlelogindetails == null &&  otplogindetails == null  ?  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Back to Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))) : Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                      onTap: (){

                                                          if(fblogindetails != null)
                                                          {
                                                            _fblogOut();
                                                          }
                                                          else if (googlelogindetails != null)
                                                          {
                                                            _googlelogOut();

                                                          }
                                                          else {
                                                            _normallogOut();
                                                          }
                                                          
                                                      },)),
                                            ),
                                           ])
                                            ),
                                        ),
                                  onRefresh: () => refresh(),
                                     ),
                                 ),
                    );
                 }
}
