import 'package:flutter/material.dart';


class AppBarPlainWidget extends StatelessWidget implements PreferredSizeWidget {
  final double appbarSize;
  final String actionMenu;
  final String title;
  AppBarPlainWidget(this.appbarSize, this.actionMenu, this.title);
@override
  Widget build(BuildContext context) { 
      return AppBar(
                                     
                                      title: Text(title),
                                      backgroundColor: Colors.blue[900],
                                      actions:  GetAppBarFunctions(actionMenu)
                                      
                                    );

}
@override
  Size get preferredSize => new Size.fromHeight(appbarSize);
}


List<Widget> GetAppBarFunctions(String action)
{
  List<Widget> sideBarActions = [];
  IconButton shareActions =  IconButton(icon: Icon(Icons.share_rounded), color: Colors.white,
                                          onPressed: (){
                                                  //to implement
                                                    });
  
  if (action=="share")
    sideBarActions.add(shareActions);


  return sideBarActions;
}