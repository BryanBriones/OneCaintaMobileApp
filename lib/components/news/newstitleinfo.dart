

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsTitleInfoWidget extends StatefulWidget {

final String headline;
final String date;
NewsTitleInfoWidget(this.headline, this.date);
 @override
  _NewsTitleInfoWidgetState createState() => _NewsTitleInfoWidgetState(this.headline,this.date);
}

class _NewsTitleInfoWidgetState extends State<NewsTitleInfoWidget>{

String formatDate(DateTime date) => new DateFormat("MMMM dd, yyyy").format(date);
String headline;
String date;
_NewsTitleInfoWidgetState(this.headline, this.date);

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
                      //  padding: EdgeInsets.only(top:10,left: 10),
                      //  height: MediaQuery.of(context).size.height *(0.23),
                      //  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      //                             color: Colors.white70
                      //                          ),
              
                       child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start ,
                          children:[
                                  Padding( padding: EdgeInsets.fromLTRB(10,10,0,0), child:Row(children: [
                                                                                  Padding(padding:EdgeInsets.only(right:3), child:Icon(Icons.calendar_today_rounded, size:15, color:  Colors.black.withOpacity(0.6),)),
                                                                                  Text( formatDate(DateTime.parse(date)),style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),)
                                                                                  ])),
                                   Padding( padding: EdgeInsets.all(10), child:Text(headline, style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[900]))),
                                    ButtonBar(
                                            alignment: MainAxisAlignment.start,
                                            buttonPadding: EdgeInsets.only(left:0),
                                            buttonMinWidth: 10,
                                            children: [ 
                                              InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      child:  FlatButton(child: Icon(Icons.favorite_rounded, color: Colors.red),
                                                onPressed: null) ,
                                                ),
                                                Text("12 people loves this story"), //NUMBER OF LIKES
                                            ],
                            ),
                       ],),
              )),
          ]);

  }
}



