//flutter material imports
import 'package:flutter/material.dart';
import 'package:ez_flutter/ez_flutter.dart';



class LoadingScreen extends StatelessWidget{
 
  
  @override
  Widget build(BuildContext context) {

    return Scaffold (  body:Container( height: MediaQuery.of(context).size.height,  child:Padding( padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.4),child:Column (mainAxisAlignment: MainAxisAlignment.center,
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
                                                                                                                                    Padding(padding: EdgeInsets.only(top:10), child:EzDots(text: Text("Loading 10%", style: TextStyle(fontWeight: FontWeight.bold),)))])
                                                                                                                                    ),
                                                                                                               ]),
                                                                                                               )
      )
    );
}
}
