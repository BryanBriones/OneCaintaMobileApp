import 'package:flutter/material.dart';


class AppBarBackButtonWidget extends StatelessWidget implements PreferredSizeWidget {
  final double appbarSize;
  final String actionMenu;
  final String title;
  AppBarBackButtonWidget(this.appbarSize, this.actionMenu, this.title);
@override
  Widget build(BuildContext context) { 
      return AppBar(
                                      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                                             Navigator.of(context).pop(true);  //back button
                                      }),
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