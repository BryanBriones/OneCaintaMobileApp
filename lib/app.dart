import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onecaintamobileapp/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext 
context) {
    
    return  MaterialApp(title: "One Cainta App",
             debugShowCheckedModeBanner: false,
             theme: ThemeData(textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme) ),
              home:  Login()
              
              //UNCOMMENT WHEN LOGIN MODULE IS ALREADY CREATED
              // FutureBuilder<Map<dynamic,dynamic>>(
              //                                 future: checkLoginStatus(),
              //                                 builder: (context, snapshot) {
              //                                       if (snapshot.hasData) {
              //                                         if(snapshot.data["IsLoggedIn"])
              //                                         {
              //                                           return Home(0,snapshot.data['UserData']);
              //                                         }
              //                                         else{
              //                                           return Login();
              //                                         }
              //                                       }
              //                                      else if (snapshot.hasError) {
              //                                         return Text("${snapshot.error}");
              //                                       }
              //                                  return Container( height: 700,
              //                   decoration: BoxDecoration(
              //                   color: Colors.yellow[700],
              //                   borderRadius: BorderRadius.all(Radius.circular(4.0))),
              //                   );
              //                                 }
              // )
        
             );
  }
}