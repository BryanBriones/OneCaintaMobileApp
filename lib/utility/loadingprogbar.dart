//flutter material imports
import 'package:flutter/material.dart';




class LoadingProgBar extends StatelessWidget{
 
  
  @override
  Widget build(BuildContext context) {

   return  Container(
            height:MediaQuery.of(context).size.height,
          child:  
         Column( mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[Expanded(
                  child:Center(child:CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue[700])))
                  ,)
                ,]));
}
}
