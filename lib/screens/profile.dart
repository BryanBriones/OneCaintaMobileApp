
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:onecaintamobileapp/screens/login.dart';

//Models
import 'package:onecaintamobileapp/model/fbusermodel.dart';

class UserProfile extends StatefulWidget {
  final FBUserModel logindetails;
  UserProfile(this.logindetails);
 @override
 State<StatefulWidget> createState() {
    return _UserProfileState(this.logindetails);
  }
}

class _UserProfileState extends State<UserProfile> with TickerProviderStateMixin{

  final FBUserModel logindetails;

_UserProfileState(this.logindetails);
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

  Future<void> _logOut() async {
  await FacebookAuth.instance.logOut();
     print("Logging out now");
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
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child: logindetails == null ?  Text("Hello, User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])) :  Text("Hello, " +  logindetails.firstName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900]))),
                                                      subtitle: Padding(padding:EdgeInsets.all(5), child: logindetails == null ?  Text("Please sign in to unlock other One Cainta features", style: TextStyle(color: Colors.black.withOpacity(0.6))) : Text(logindetails.email,style: TextStyle(color: Colors.black.withOpacity(0.6)))), //Email Address
                                                      trailing: CircleAvatar(
                                                        radius: 30.0,
                                                        backgroundImage: logindetails == null ? AssetImage('assets/emptyavatar.png') : NetworkImage(logindetails.picture.data.url),
                                                        backgroundColor: Colors.transparent
                                                        ) ,
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
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                      onTap: (){
                                                         _logOut();

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
