
//Flutter Material 
import 'package:flutter/material.dart';


//Models
import 'package:onecaintamobileapp/model/fbusermodel.dart';

//Components
import 'package:onecaintamobileapp/components/home/appbar.dart';


//Screens
import 'package:onecaintamobileapp/screens/mainportal.dart';
import 'package:onecaintamobileapp/screens/news.dart';
import 'package:onecaintamobileapp/screens/covid19updates.dart';





class Home extends StatefulWidget {
  int index =0;
  FBUserModel logindetails;
  Home(this.index, this.logindetails);
 @override
 State<StatefulWidget> createState() {
    return _HomeState(index, logindetails);
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
   final FBUserModel logindetails;
  _HomeState(this._currentIndex, this.logindetails);
   List<Widget> _children =[];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
  _scaffoldKey.currentState.openDrawer();
}
// deleteLogonCredentials() async{
//                   // Create storage
// final storage = new FlutterSecureStorage();

// // Delete all 
// await storage.deleteAll();

// }
// Future<void> _logOut() async {
//   await FacebookAuth.instance.logOut();
//      print("Logging out now");
//   setState(() {
//   showToast("Logging off...");
//    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
//                    {return Login();}),(Route<dynamic> route) => false);
//   });
// }
// void _closeDrawer() {
//   Navigator.of(context).pop();
// }
//    @override
//    void initState() {
//      super.initState();
//      setState(() {
//        _currentIndex =1;
//      });
//    // _children = [MainNavigation()];
//    }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( length: 5, initialIndex: _currentIndex,
      child:Scaffold( 
                    appBar:  AppBarWidget(90, "avatar", "One Cainta", "mainTabView","menu",null,logindetails),
                    body:TabBarView(
                       children:
                                            [
                                              Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.9,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child: 
                                                        Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.035, MediaQuery.of(context).size.height * 0.035, MediaQuery.of(context).size.width * 0.035, MediaQuery.of(context).size.height * 0.035),child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[Expanded(
                                                                               child:MainPortal()
                                                                               ,)
                                                                             ,]  ),)
                                                                ),
                                                    )
                                              ),
                                                Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                       height:MediaQuery.of(context).size.height * 0.9,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200]),
                                                      child:  
                                                                     Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.035, 0, MediaQuery.of(context).size.width * 0.035, MediaQuery.of(context).size.height * 0.035),child:
                                                                        Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children:[Expanded(
                                                                                  child: News()
                                                                                  )
                                                                                ,]  )
                                                                     )     
                                                                        
                                                                ),
                                                    )
                                              ),
                                              Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.9,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:   Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.035, 0, MediaQuery.of(context).size.width * 0.035, MediaQuery.of(context).size.height * 0.035),child:
                                                                        Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children:[Expanded(
                                                                                  child: COVID19Update()
                                                                                  )
                                                                                ,]  )
                                                                     )     
                                                                        
                                                                ),
                                                    )
                                              ),
                                               Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.9,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.035, 0, MediaQuery.of(context).size.width * 0.035, MediaQuery.of(context).size.height * 0.035),child:
                                                                        Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children:[Expanded(
                                                                                  child: News()
                                                                                  )
                                                                                ,]  )
                                                                     )     
                                                                        
                                                                ),
                                                    )
                                              ),
                                                   Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.9,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.035, 0, MediaQuery.of(context).size.width * 0.035, MediaQuery.of(context).size.height * 0.035),child:
                                                                        Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children:[Expanded(
                                                                                  child: News()
                                                                                  )
                                                                                ,]  )
                                                                     )     
                                                                        
                                                                ),
                                                    )
                                              )
                       ]),
                        key: _scaffoldKey
                          //               drawer: Drawer(
                          //                          child: ListView(
                          // // Important: Remove any padding from the ListView.
                          // padding: EdgeInsets.zero,
                          // children: <Widget>[
                          //   Container(
                          //     height: 85.0,
                          //     child: DrawerHeader(
                          //       child: Text(
                          //         'My Dashboard',
                          //         style: new TextStyle(fontSize: 18.0, color: Colors.white),
                          //       ),
                          //       decoration: BoxDecoration(
                          //         color: Colors.blue[900],
                          //       ),
                          //     ),
                          //   ),
                          //     ListTile(
                          //       leading: Icon(Icons.person_outline,color: Colors.blue[900],),
                          //      title: Text('My Profile'),
                          //       onTap: () {
                          //         _closeDrawer();
                          //        Navigator.push(context, MaterialPageRoute(builder: (_) {                                                          
                          //                                                               return UserProfile();
                          //                                                               }));
                          //       },
                          //    ),
                          //       ListTile(
                          //         leading: Icon(Icons.calendar_today,color: Colors.blue[900],),
                          //      title: Text('Apply for Jobs'),
                          //       onTap: () {
                          //       },
                          //    ),
                          //        ListTile(
                          //          leading: Icon(Icons.favorite,color: Colors.blue[900],),
                          //      title: Text('Donate to LGUs'),
                          //       onTap: () {
                          //       },
                          //    ),
                          //        ListTile(
                          //       leading: Icon(Icons.exit_to_app,color: Colors.blue[900],),
                          //      title:  Text('Logout'),//logindetails== null ? Text('Sign up or Log in') : Text('Logout'),
                          //       onTap: () {
                          //         // deleteLogonCredentials();
                          //         //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                          //         //    {return Login();}),(Route<dynamic> route) => false);
                          //         _logOut();     
                          //       },
                          //    ),
                          //                     ]),// Populate the Drawer in the next step.
                          //              ) 
                       )
    );
  }
 
 
 //BOTTOM MENU NAVIGATION SET STATE METHOD
  void onTabTapped(int index) {
    setState(() {
   
        _currentIndex = index;
 
    });
  }
 }


