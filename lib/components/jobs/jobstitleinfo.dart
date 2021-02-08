

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class JobsTitleInfoWidget extends StatefulWidget {

final String jobheadline;
final String date;
final int salaryrangelow;
final int salaryrangehigh;

JobsTitleInfoWidget(this.jobheadline, this.date, this.salaryrangelow, this.salaryrangehigh);
 @override
  _JobsTitleInfoWidgetState createState() => _JobsTitleInfoWidgetState(this.jobheadline, this.date,this.salaryrangelow, this.salaryrangehigh);
}

class _JobsTitleInfoWidgetState extends State<JobsTitleInfoWidget>{

final String jobheadline;
final String date;
final int salaryrangelow;
final int salaryrangehigh;
_JobsTitleInfoWidgetState(this.jobheadline, this.date, this.salaryrangelow, this.salaryrangehigh);

 final _key = new GlobalKey<FormState>();

 
String formatDate(DateTime date) => new DateFormat("MMMM dd, yyyy").format(date);
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
                                  Padding( padding: EdgeInsets.fromLTRB(10,10,0,0), child:Row(children: [
                                                                                  Padding(padding:EdgeInsets.only(right:3), child:Icon(Icons.calendar_today_rounded, size:15, color:  Colors.black.withOpacity(0.6),)),
                                                                                  Text( formatDate(DateTime.parse(date)),style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),)
                                                                                  ])),
                                   Padding( padding: EdgeInsets.all(10), child:Text(jobheadline, style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[900]))),
                                    ButtonBar(
                                            alignment: MainAxisAlignment.start,
                                            buttonPadding: EdgeInsets.only(left:0),
                                            buttonMinWidth: 10,
                                            children: [ 
                                              InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      child:  FlatButton(child: Icon(Icons.money, color: Colors.green),
                                                onPressed: null) ,
                                                ),
                                                Text('PHP ' + salaryrangelow.toString() + ' - ' + salaryrangehigh.toString()), 
                                            ],
                            ),
                       ],),
              )),
          ]);

  }
}



