import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/model/otpusermodel.dart';

//Models
import 'package:onecaintamobileapp/model/fbusermodel.dart';
import 'package:onecaintamobileapp/model/googleusermodel.dart';
import 'package:onecaintamobileapp/model/otpusermodel.dart';

//Screens
import 'package:onecaintamobileapp/screens/profile.dart';




class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double appbarSize;
  final String actionMenu;
  final String title;
  final String tabMenu;
  final String leadingAction;
  final FBUserModel fblogindetails;
  final GoogleUserModel googlelogindetails;
  final OTPUserModel otplogindetails;
    void openDrawer;
  AppBarWidget(this.appbarSize, this.actionMenu, this.title, this.tabMenu, this.leadingAction, this.openDrawer, this.fblogindetails, this.googlelogindetails, this.otplogindetails);
@override
  Widget build(BuildContext context) { 
      return AppBar(
                                      automaticallyImplyLeading: false,
                                   // leading: GetLeadingFunction(context, leadingAction, openDrawer),
                                      centerTitle: false,
                                      title: Padding( padding: EdgeInsets.only(top:10), child:Text(title, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
                                      backgroundColor: Colors.blue[900],
                                      actions: GetAppBarFunctions(context,actionMenu,fblogindetails, googlelogindetails,otplogindetails),
                                      bottom: GetAppBarTabView(tabMenu),
                                    
                                    );

}
@override
  Size get preferredSize => new Size.fromHeight(appbarSize);
}



List<Widget> GetAppBarFunctions(BuildContext context, String action, FBUserModel fblogindetails,GoogleUserModel googlelogindetails, OTPUserModel otplogindetails)
{
  List<Widget> sideBarActions = [];    



  GestureDetector avatarActions =  fblogindetails != null ?
                                     GestureDetector( child: //IF FB LOGIN
                                          Padding( padding: EdgeInsets.fromLTRB(0,5,5,0), child:CircleAvatar(radius:25, backgroundImage: fblogindetails == null ? AssetImage('assets/emptyavatar.png') : NetworkImage(fblogindetails.picture.data.url), backgroundColor: Colors.transparent,),
                                        ),
                                          onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                          return UserProfile(fblogindetails, null, null);
                                            }));}
                                      ) : 
                                    googlelogindetails != null ? //IF GOOGLE LOGIN
                                    GestureDetector( child:
                                          Padding( padding: EdgeInsets.fromLTRB(0,5,5,0), child:CircleAvatar(radius:25, backgroundImage: googlelogindetails == null ? AssetImage('assets/emptyavatar.png') : NetworkImage(googlelogindetails.photoUrl), backgroundColor: Colors.transparent,),
                                        ),
                                          onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                          return UserProfile(null, googlelogindetails, null);
                                            }));}
                                      ) : 
                                      otplogindetails != null ? //IF OTP LOGIN
                                    GestureDetector( child:
                                          Padding( padding: EdgeInsets.fromLTRB(0,5,5,0), child:CircleAvatar(radius:25, backgroundImage: AssetImage('assets/emptyavatar.png'), backgroundColor: Colors.transparent,),
                                        ),
                                          onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                          return UserProfile(null, null, otplogindetails);
                                            }));}
                                      ) : 

                                        GestureDetector( child: //IF OTP OR NO LOGIN
                                          Padding( padding: EdgeInsets.fromLTRB(0,5,5,0), child:CircleAvatar(radius:25, backgroundImage: AssetImage('assets/emptyavatar.png'), backgroundColor: Colors.transparent,),
                                        ),
                                          onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                          return UserProfile(null, null, null);
                                            }));}
                                      );

                                                      
 
  if (action=="avatar")
    sideBarActions.add(avatarActions);



  return sideBarActions;
}


Widget GetAppBarTabView(String action)
{
  Widget tabBarActions = null;

    PreferredSize mainTabActions = PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.black.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    
                    tabs: [
                     Tab(
                        child: Text('Main Portal', style: TextStyle(color: Colors.white),),
                      ),
                      Tab(
                        child: Text('Recent News', style: TextStyle(color: Colors.white),),
                      ),
                      Tab(
                        child: Text('COVID-19 Updates', style: TextStyle(color: Colors.white),),
                      ),
                       Tab(
                        child: Text('Programs/Awards', style: TextStyle(color: Colors.white),),
                      ),
                      Tab(
                        child: Text('Disaster Preparedness', style: TextStyle(color: Colors.white),),
                      )

                    ]),
                preferredSize: Size.fromHeight(30.0),);

  if(action=="mainTabView")
    tabBarActions =mainTabActions;

    // if (action=="eventsTabView")
    // tabBarActions = eventsTabActions;
    // if(action=="profileinfoTabView")
    // tabBarActions =profileinfoTabActions;
    
  return tabBarActions;
}

Widget GetLeadingFunction (context, String action, void opendrawer)

{
 
 Widget leadingAction= null;
 
 
  IconButton backAction =IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: (){
                                             Navigator.of(context).pop(true);  //back button
                                      });

  IconButton menuAction =IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: (){
                                             Scaffold.of(context).openDrawer();
                                      });
     if (action=="back")
     {
     leadingAction =backAction;

     }

      if (action=="menu")
     {
     leadingAction =menuAction;

     }


     return leadingAction;



}

