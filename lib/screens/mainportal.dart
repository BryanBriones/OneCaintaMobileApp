//flutter material imports
import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:onecaintamobileapp/screens/home.dart';

//Screens
import 'package:onecaintamobileapp/screens/onedonation.dart';
import 'package:onecaintamobileapp/screens/wastemanagementform.dart';
import 'package:onecaintamobileapp/screens/policies.dart';
import 'package:onecaintamobileapp/screens/contactus.dart';
import 'package:onecaintamobileapp/screens/calendar.dart';
import 'package:onecaintamobileapp/screens/jobopening.dart';
import 'package:onecaintamobileapp/screens/onlinereservations.dart';
import 'package:onecaintamobileapp/utility/loadingscreen.dart';

class MainPortal extends StatefulWidget{
 @override
_MainPortalState createState() => _MainPortalState();

}

class _MainPortalState extends State<MainPortal>{
     int index = 0;
    List<String> menus = ["Announcements", "One Cainta Pass", "One Services", "One Donation", "One Negosyo","One Organization", "COVID-19 Updates","COVID-19 Vaccine", "Waste Management", "Job Openings", "Online Reservation", "Policies", "Calendar",  "Contact Us"];

        List<Widget> icons = [Icon(Icons.announcement_rounded, color: Colors.blue, size: 70,),
                               Icon(Icons.check_circle_rounded, color: Colors.blue, size: 70,),
                               Icon(Icons.payments_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.business_center_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.add_business_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.group, color: Colors.blue, size: 70,), 
                               Icon(Icons.report_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.medical_services_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.delete_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.backpack_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.receipt_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.local_police_rounded, color: Colors.blue, size: 70,), 
                               Icon(Icons.calendar_today_rounded, color: Colors.blue, size: 70,),
                               Icon(Icons.phone_rounded, color: Colors.blue, size: 70,)];

            List<Widget> actions = [Home(1, null,null,null),
                               null, //ONECAINTAPASS
                               null, //ONESERVICES
                               OneDonation(), //ONEDONATION
                               null, //ONENEGOSYO
                               null, //ONEORGANIZATION
                               Home(2, null,null,null), //COVID19UPDATES
                               null, //COVID19VACCINE
                               WasteManagementForm(), //WASTEMANAGEMENT
                               JobOpening(), 
                               OnlineReservation(),
                               PoliciesGuidelines(),  //POLICIES
                               Calendar(),
                               ContactUs()]; //CONTACTUS

void goToMenu() async
    {
      


       EzLoadingBloc bloc =EzBlocProvider.of<EzGlobalBloc>(context).get(EzLoadingBloc);

        for (int i = 0; i < 101; i++) {
           bloc.addition.add("Loading $i%");
         await new Future.delayed(const Duration(milliseconds: 5));
        }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                         return actions[index];}));

    }
bool checkIndex( int i)
{
  setState(() {

    index = i;
    
  });

  if (actions[index] != null)
  {
    return true;
  }

  else{

      return false;
  }


}
  @override
  Widget build(BuildContext context) {

    return StaggeredGridView.countBuilder(
  crossAxisCount: 4,
  itemCount: 14,
  itemBuilder: (BuildContext context, int index) => Material(
            child: Ink ( decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(4.0))), 
            child: InkWell(  onTap: () => checkIndex(index) ? Navigator.push(context, MaterialPageRoute(builder: (context) =>  EzTransition(LoadingScreen(),
                                                                goToMenu,
                                                                backgroundColor: Colors.white)))  : true,
            
         splashFactory: InkRipple.splashFactory,
         splashColor: Colors.blue[100],
         child:  GestureDetector( 
            child: Stack (children: [
                  Align(alignment: Alignment.center , child: Padding( padding: EdgeInsets.only(bottom: 20.0), child:icons[index]),),
                  Align( alignment: FractionalOffset.bottomCenter, child: Padding( padding: EdgeInsets.only(bottom: 20.0,), child:Text(menus[index], style: TextStyle(fontWeight: FontWeight.bold),)), ),
          ]),
      onTap: () => checkIndex(index) ? Navigator.push(context, MaterialPageRoute(builder: (context) =>  EzTransition(LoadingScreen(),
                                                                goToMenu,
                                                                backgroundColor: Colors.white))) : null,
                 
      ),
     ),
    ),
  ),
  staggeredTileBuilder: (int index) =>
      StaggeredTile.count(2, 2),
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  );
  }



}
