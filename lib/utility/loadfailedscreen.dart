//flutter material imports
import 'package:flutter/material.dart';




class LoadFailedScreen extends StatelessWidget{
 
  
  @override
  Widget build(BuildContext context) {

   return  Container( height: MediaQuery.of(context).size.height,  child:Padding( padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.2),child:Column (mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,children:[ Expanded(child:
                                                                                                                          Column(
                                                                                                                                  children: <Widget>[
                                                                                                                                      Container(width: 80, height:80, 
                                                                                                                                              decoration: new BoxDecoration(
                                                                                                                                                image: new DecorationImage(
                                                                                                                                                
                                                                                                                                                  image: new AssetImage("assets/caintalogo.png"),
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                ),)),       
                                                                                                                                    Center(child:Text("One Cainta", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue[900]),)),
                                                                                                                                     Center(child:Padding(padding: EdgeInsets.only(top:10,left:15,right:15), child:Text("Unable to load, please check internet connection and swipe down to try again.", style: TextStyle(fontWeight: FontWeight.bold),)))])
                                                                                                                                    ),
                                                                                                               ]),
   )
                                                                                                               
      );
}
}
