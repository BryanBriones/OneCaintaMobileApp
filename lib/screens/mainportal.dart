//flutter material imports
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class MainPortal extends StatelessWidget{
    //  final UserModel logindetails;
    //   Favorites(this.logindetails);
    List<String> menus = ["Announcements", "ONE Services", "ONE Donate", "ONE Negosyo", "Policies", "Calendar", "ONE Organization", "Contact Us"];
        List<Widget> icons = [Icon(Icons.announcement_rounded, color: Colors.blue, size: 70,), Icon(Icons.payments_rounded, color: Colors.blue, size: 70,), Icon(Icons.business_center_rounded, color: Colors.blue, size: 70,), Icon(Icons.business_rounded, color: Colors.blue, size: 70,), Icon(Icons.local_police_rounded, color: Colors.blue, size: 70,), Icon(Icons.calendar_today_rounded, color: Colors.blue, size: 70,),Icon(Icons.group, color: Colors.blue, size: 70,), Icon(Icons.contact_support_rounded, color: Colors.blue, size: 70,)];
  @override
  Widget build(BuildContext context) {

    return StaggeredGridView.countBuilder(
  crossAxisCount: 4,
  itemCount: 8,
  itemBuilder: (BuildContext context, int index) => Material(
            child: Ink ( decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(4.0))), 
            child: InkWell(  onTap: () => true, 
         splashFactory: InkRipple.splashFactory,
         splashColor: Colors.blue[100],
         child:  GestureDetector( 
            child: Stack (children: [
                  Align(alignment: Alignment.center , child: Padding( padding: EdgeInsets.only(bottom: 20.0), child:icons[index]),),
                  Align( alignment: FractionalOffset.bottomCenter, child: Padding( padding: EdgeInsets.only(bottom: 20.0,), child:Text(menus[index], style: TextStyle(fontWeight: FontWeight.bold),)), ),
          ]),
      onTap: null
      ),
     ),
    ),
  ),
  staggeredTileBuilder: (int index) =>
      StaggeredTile.count(2, 2),// StaggeredTile.count(2, index.isEven ? 2 : 1),
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  );
  }



}
