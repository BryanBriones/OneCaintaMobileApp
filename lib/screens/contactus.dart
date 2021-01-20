import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';


//Models

class ContactUs extends StatefulWidget {
 @override
 State<StatefulWidget> createState()  => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> with TickerProviderStateMixin{


bool isLoading = false;

Future<void> refresh(){
  setState(() {
    
  });
}



  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "Contact us"),

                    body:Scrollbar(child:RefreshIndicator(
                    
                       child:  SingleChildScrollView(
                        child: Container(
                                           height: MediaQuery.of(context).size.height,
                                           child:Column(                  
                                                children:  [
                                                Padding(padding: EdgeInsets.only(top:10), child: ListTile(
                                                      title:  Text("Emergency Hotlines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                      subtitle: Text("You can contact these numbers for emergency:", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                      trailing: Icon(Icons.info_rounded,color:Colors.yellow[700], size:30) ,)),
                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                            ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, int index){
                                        return GestureDetector( child:  InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.phone_rounded,color: Colors.black.withOpacity(0.6), ), //Icon(Icons.phone_android_rounded,color: Colors.black.withOpacity(0.6), ),
                                                      title: Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Department" + " " + index.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                      trailing:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("655-2769", style: TextStyle( fontSize: 15, color: Colors.black))),
                                                      onTap: null,)),
                                            ),
                                                                                
                                         onTap: () {
                                                                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                        // return NewsDetail(imgList[index],headlines[index], newsdates[index]);}));                                  
                                     },                 
                                      );
                                  }),
                                            
                                              
                                              Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                               Padding(padding: EdgeInsets.only(top:10), child: ListTile(
                                                      title:  Text("Municipal Contact Numbers", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                      subtitle: Text("For other Cainta government hotlines:", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                      trailing: Icon(Icons.info_rounded,color:Colors.yellow[700], size:30) ,)),
                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                                        ListView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: 3,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContext context, int index){
                                                  return GestureDetector( child:  InkWell(
                                                                onTap: () => true,
                                                                splashFactory: InkRipple.splashFactory,
                                                                highlightColor: Colors.blue[100],
                                                                child: GestureDetector(child:ListTile(
                                                                leading: Icon(Icons.phone_android_rounded,color: Colors.black.withOpacity(0.6), ), //Icon(Icons.phone_rounded,color: Colors.black.withOpacity(0.6), ),
                                                                title: Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Municipal Office" + " " + index.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                                trailing:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("655-2769", style: TextStyle( fontSize: 15, color: Colors.black))),
                                                                onTap: null,)),
                                                      ),
                                                                                          
                                                  onTap: () {
                                                                                  // Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                                  // return NewsDetail(imgList[index],headlines[index], newsdates[index]);}));                                  
                                              },                 
                                                );
                                            }),
                                           ])
                                            ),
                                        ),
                                  onRefresh: () => refresh(),
                                     ),
                                 ),
                    );
                 }
}
