//flutter material imports
import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';



class ComingSoon extends StatelessWidget{
  final String pagename;

  ComingSoon(this.pagename);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (  
       appBar:  AppBarBackButtonWidget(60,"none", pagename),
      body:Container( height: MediaQuery.of(context).size.height,  child:Padding( padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.2),child:Column (mainAxisAlignment: MainAxisAlignment.center,
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
                                                  Padding(padding: EdgeInsets.only(top:10), child:Text("Feature not yet available", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black.withOpacity(0.6)))),
                                                  Padding(padding: EdgeInsets.only(top:10), child:Text("Launching soon!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.black.withOpacity(0.6)),))])
                                                  ),
         ]),
       )
      )
    );
}
}
