
//Flutter Material 
import 'package:flutter/material.dart';

//Components
import 'package:onecaintamobileapp/components/home/appbar.dart';

//Screens
import 'package:onecaintamobileapp/screens/mainportal.dart';
import 'package:onecaintamobileapp/screens/news.dart';




class Home extends StatefulWidget {
  int index =0;
 // UserModel logindetails;
  Home(this.index);
 @override
 State<StatefulWidget> createState() {
    return _HomeState(index);
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
   //final UserModel logindetails;
  _HomeState(this._currentIndex);
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

void _closeDrawer() {
  Navigator.of(context).pop();
}
   @override
   void initState() {
     super.initState();
     setState(() {
       _currentIndex =1;
     });
   // _children = [MainNavigation()];
   }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( length: 6, initialIndex: _currentIndex,
      child:Scaffold( 
                    appBar:  AppBarWidget(80, "avatar", "ONE Cainta", "mainTabView","menu",null),
                    body:TabBarView(
                       children:
                                            [Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.85,
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
                                                       height:MediaQuery.of(context).size.height * 0.85,
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
                                                         height:MediaQuery.of(context).size.height * 0.85,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[Expanded(
                                                                               child:Center(child:Text("No News Feed Yet"))
                                                                               ,)
                                                                             ,]  )
                                                                        
                                                                ),
                                                    )
                                              ),
                                               Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.85,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[Expanded(
                                                                               child:Center(child:Text("No News Feed Yet"))
                                                                               ,)
                                                                             ,]  )
                                                                        
                                                                ),
                                                    )
                                              ),
                                                   Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.85,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[Expanded(
                                                                               child:Center(child:Text("No News Feed Yet"))
                                                                               ,)
                                                                             ,]  )
                                                                        
                                                                ),
                                                    )
                                              ),
                                                   Scrollbar(child: SingleChildScrollView(
                                                      child: Container(
                                                         height:MediaQuery.of(context).size.height * 0.85,
                                                      decoration: BoxDecoration(
                                                       color: Colors.grey[200],
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Column( mainAxisAlignment: MainAxisAlignment.center,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[Expanded(
                                                                               child:Center(child:Text("No News Feed Yet"))
                                                                               ,)
                                                                             ,]  )
                                                                        
                                                                ),
                                                    )
                                              ),
                       ]),
                        key: _scaffoldKey,
                       drawer: Drawer(
                                   child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 85.0,
              child: DrawerHeader(
                child: Text(
                  'My Dashboard',
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
              ),
            ),
              ListTile(
                leading: Icon(Icons.person_outline,color: Colors.blue[900],),
               title: Text('My Profile'),
                onTap: () {
                  _closeDrawer();
                 Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                        //return UserProfile(logindetails);
                                                                        return null;
                                                                        }));
                },
             ),
                ListTile(
                  leading: Icon(Icons.calendar_today,color: Colors.blue[900],),
               title: Text('Apply for Jobs'),
                onTap: () {
               
                },
             ),
                 ListTile(
                   leading: Icon(Icons.favorite,color: Colors.blue[900],),
               title: Text('Donate to LGUs'),
                onTap: () {
                
                },
             ),

                 ListTile(
                leading: Icon(Icons.exit_to_app,color: Colors.blue[900],),
               title:  Text('Logout'),//logindetails== null ? Text('Sign up or Log in') : Text('Logout'),
                onTap: () {

                  // deleteLogonCredentials();
                  //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                  //    {return Login();}),(Route<dynamic> route) => false);
                },
             ),
           
                              ]),// Populate the Drawer in the next step.
                       ) )
    );

    //                  // bottomNavigationBar: BottomNavigationBar(
    //                  //                                     onTap: onTabTapped,
    //                  //                                     backgroundColor: Colors.yellow[700],
    //                  //                                     selectedItemColor: Colors.white70,
    //                  //                                     unselectedItemColor: Colors.black,
    //                  //                                     currentIndex: _currentIndex, // this will be set when a new tab is tapped
    //                  //                                     type: BottomNavigationBarType.fixed,
    //                  //                                     items: [
    //                  //                                       BottomNavigationBarItem(
    //                  //                                         icon: Icon(Icons.new_releases),
    //                  //                                         title: Text('Explore'),
                                                             
    //                  //                                       ),
                 
    //                  //                                       // BottomNavigationBarItem(
    //                  //                                       //   icon: Icon(Icons.favorite),
    //                  //                                       //   title: Text('Favorites'),
    //                  //                                       // ),
    //                  //                                       // BottomNavigationBarItem(
    //                  //                                       //   icon: Icon(Icons.list),
    //                  //                                       //   title: Text('My Events')
    //                  //                                       // ),
    //                  //                                       BottomNavigationBarItem(
    //                  //                                         icon: Icon(Icons.person),
    //                  //                                         title: Text('Profile')
    //                  //                                       ),
    //                  //                                     ],
    //                  //                                   ),
    //  ) );
  }
 
 
 //BOTTOM MENU NAVIGATION SET STATE METHOD
  void onTabTapped(int index) {
    setState(() {
   
        _currentIndex = index;
 
    });
  }
 }


