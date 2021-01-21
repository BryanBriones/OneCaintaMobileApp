

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OneNegosyoTitleInfoWidget extends StatefulWidget {

  final String businessname;
  final String businessCategory;
  final String businessLocation;
  final String openHour;
  final String closeHour;
  final String businessDay;
  final String contactdetail;
OneNegosyoTitleInfoWidget(this.businessname, this.businessCategory, this.businessLocation, this.openHour, this.closeHour, this.businessDay, this.contactdetail);
 @override
  _OneNegosyoTitleInfoWidgetState createState() => _OneNegosyoTitleInfoWidgetState(this.businessname, this.businessCategory, this.businessLocation, this.openHour, this.closeHour, this.businessDay,this.contactdetail);
}

class _OneNegosyoTitleInfoWidgetState extends State<OneNegosyoTitleInfoWidget>{
   String businessname;
   String businessCategory;
   String businessLocation;
   String openHour;
   String closeHour;
   String businessDay;
String contactdetail;
_OneNegosyoTitleInfoWidgetState(this.businessname, this.businessCategory, this.businessLocation, this.openHour, this.closeHour, this.businessDay, this.contactdetail);

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
                                  Padding( padding: EdgeInsets.fromLTRB(10,10,0,0)),
                                   Padding( padding: EdgeInsets.fromLTRB(10,10,0,0), child:Text(businessname , style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[900]))),
                                   Padding(padding: EdgeInsets.fromLTRB(10,5,0,0), child:Text(businessCategory, style: TextStyle( fontStyle: FontStyle.italic),),),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  Padding( padding:  EdgeInsets.fromLTRB(10,5,0,0), child: Icon(Icons.location_city_rounded, size:15, color:  Colors.black,)),
                                  Padding(padding: EdgeInsets.fromLTRB(10,5,0,0), child: Text(businessLocation, style: TextStyle(  color: Colors.grey[700],fontWeight: FontWeight.bold,),)),
                                  ]),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.fromLTRB(10,5,0,0), child:Icon(Icons.timer,size:15, color:  Colors.black,)),
                                    Padding(padding: EdgeInsets.fromLTRB(10,5,0,0), child:  Text('Opens - ' + openHour +
                                    '-' + closeHour + ' (' + businessDay  + ')'),),
                                  ]),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.fromLTRB(10,5,0,0), child:Icon(Icons.storefront_sharp,size:15, color:  Colors.black,)),
                                    Padding(padding: EdgeInsets.fromLTRB(10,5,0,0), child:  Text("Contact: "+ contactdetail)),
                                  ]),
                                     
                       
                       ],),
              )),
          ]);

  }
}



