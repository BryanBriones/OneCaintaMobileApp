
import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';


class UserProfile extends StatefulWidget {
  UserProfile();
 @override
 State<StatefulWidget> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile> with TickerProviderStateMixin{
_UserProfileState();

bool IsRefresh = false;
bool isLoading = false;
showloadingscreen(BuildContext context)
   {
         
    AlertDialog alert=AlertDialog(
           backgroundColor: Colors.yellow[700],
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
  
  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
  //                return Home(1,logindetails);
  //                 }));
  
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
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Hello Bryan,", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900]))),
                                                      subtitle: Padding(padding:EdgeInsets.all(5), child:Text('aaronbryan.briones@gmail.com',style: TextStyle(color: Colors.black.withOpacity(0.6)))), //Email Address
                                                      trailing: CircleAvatar(
                                                        radius: 30.0,
                                                        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
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
                                                      leading: Icon(Icons.book_outlined,color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Download Forms", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                      onTap: null,)),
                                            ),
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
                                                      onTap: null,)),
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
