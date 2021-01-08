import 'package:flutter/material.dart';

//Screens
import 'package:onecaintamobileapp/screens/profile.dart';




class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double appbarSize;
    final String actionMenu;
       final String title;
       final String tabMenu;
       final String leadingAction;
        //  final UserModel logindetails;
          void openDrawer;
  AppBarWidget(this.appbarSize, this.actionMenu, this.title, this.tabMenu, this.leadingAction, this.openDrawer);
@override
  Widget build(BuildContext context) { 
      return AppBar(
                                      automaticallyImplyLeading: false,
                                      leading: GetLeadingFunction(context, leadingAction, openDrawer),
                                      centerTitle: false,
                                      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 23),),
                                      backgroundColor: Colors.blue[900],
                                      actions: GetAppBarFunctions(context,actionMenu),
                                      bottom: GetAppBarTabView(tabMenu),
                                    
                                    );

}
@override
  Size get preferredSize => new Size.fromHeight(appbarSize);
}



List<Widget> GetAppBarFunctions(BuildContext context, String action)
{
  List<Widget> sideBarActions = [];
  IconButton avatarActions = IconButton(icon: CircleAvatar(child:Icon(Icons.person, color: Colors.white, size: 30,), backgroundColor: Colors.transparent,),
                                             onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                          return UserProfile();
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
                        child: Text('Programs/Awards', style: TextStyle(color: Colors.white),),
                      ),
                      Tab(
                        child: Text('Traffic Reports', style: TextStyle(color: Colors.white),),
                      ),
                      Tab(
                        child: Text('Disaster Preparedness', style: TextStyle(color: Colors.white),),
                      ),
                       Tab(
                        child: Text('Peace and Order', style: TextStyle(color: Colors.white),),
                      ),
                     
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

