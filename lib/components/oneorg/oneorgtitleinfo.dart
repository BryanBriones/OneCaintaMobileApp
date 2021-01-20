

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OneOrgTitleInfoWidget extends StatefulWidget {

final String govOfficial;
final String govOffice;

OneOrgTitleInfoWidget(this.govOfficial, this.govOffice);
 @override
  _OneOrgTitleInfoWidgetState createState() => _OneOrgTitleInfoWidgetState(this.govOfficial, this.govOffice);
}

class _OneOrgTitleInfoWidgetState extends State<OneOrgTitleInfoWidget>{

final String govOfficial;
final String govOffice;
_OneOrgTitleInfoWidgetState(this.govOfficial, this.govOffice);

 final _key = new GlobalKey<FormState>();
showloadingscreen(BuildContext context)
   {
     
                 
    AlertDialog alert=AlertDialog(
           backgroundColor: Colors.yellow[700],
      content: new Row(
        children: [
          CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
          Container(margin: EdgeInsets.only(left: 30),child:Text("Loading..." , style: TextStyle(color:Colors.white),)),
        ],),
    );
    showDialog(barrierDismissible: false,

      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  

   }
@override
  Widget build(BuildContext context) { 
        return  Row(
          children: 
          [ 
            Expanded(child:Material( 
                       child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start ,
                          children:[
                                   Padding( padding: EdgeInsets.all(10), child:Text(govOfficial, style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[900]))),
                                    ButtonBar(
                                            alignment: MainAxisAlignment.start,
                                            buttonPadding: EdgeInsets.only(left:0),
                                            buttonMinWidth: 10,
                                            children: [ 
                                              InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      child:  FlatButton(child: Icon(Icons.business_rounded, color: Colors.green),
                                                onPressed: null) ,
                                                ),
                                                Text(govOffice, style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold))
                                            ],
                            ),
                       ],),
              )),
          ]);

  }
}



