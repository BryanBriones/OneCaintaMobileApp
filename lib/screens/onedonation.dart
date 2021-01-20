import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';


//Models

class OneDonation extends StatefulWidget {
 @override
 State<StatefulWidget> createState()  => _OneDonationState();
}

class _OneDonationState extends State<OneDonation> with TickerProviderStateMixin{


bool isLoading = false;

Future<void> refresh(){
  setState(() {
    
  });
}



  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "One Donation"),

                    body:Scrollbar(child:RefreshIndicator(
                    
                       child:  SingleChildScrollView(
                        child: Container(
                                           //height: MediaQuery.of(context).size.height,
                                           
                                           child:Column(                  
                                                children:  [
                                                Padding(padding: EdgeInsets.only(top:10), child: ListTile(
                                                      title:  Text("Donation Drive", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                      subtitle: Text("Where you can send donations, relief goods and financial assistance", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                      trailing: Icon(Icons.favorite_outline_sharp,color:Colors.red[700], size:30) ,)),
                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                            
                                             InkWell(
                                                     onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.location_city_rounded,color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Relief Goods Canned Goods, Clothes, etc. can be sent to:\n\nBlk 1 Lot 16 Municipal Hall, Cainta, Rizal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)
                                                      ),
                                                      ),
                                                    
                                                      onTap: null,)),
                                            ),
                                             InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.mobile_friendly_rounded,color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("GCash", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)
                                                      ),
                                                      ),
                                                      trailing: Text("0999-999-999", style: TextStyle(fontSize: 15, color: Colors.black)),
                                                      onTap: null,)),
                                            ),
                                                InkWell(
                                                     onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.payments_rounded, color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("BPI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)
                                                      ),
                                                      ),
                                                      trailing: Text("29039275244", style: TextStyle( fontSize: 15, color: Colors.black)),
                                                      onTap: null,)),
                                            ),
                                            InkWell(
                                                     onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.payments_rounded,color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("BDO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)
                                                      ),
                                                      ),
                                                      trailing: Text("29039275244", style: TextStyle( fontSize: 15, color: Colors.black)),
                                                      onTap: null,)),
                                            ),
                                                      
                                              Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                               Padding(padding: EdgeInsets.only(top:10), child: ListTile(
                                                      title:  Text("Charities/Organization you helped", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                      subtitle: Text("Here are the charitable organizations you will be helping:", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                      trailing: Icon(Icons.favorite_outline_sharp,color:Colors.red[700], size:30) )),
                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                            ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 7,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, int index){
                                        return GestureDetector( child: 
                                          InkWell(
                                                      onTap: () => true,
                                                      splashFactory: InkRipple.splashFactory,
                                                      highlightColor: Colors.blue[100],
                                                      child: GestureDetector(child:ListTile(
                                                      leading: Icon(Icons.business_rounded,color: Colors.black.withOpacity(0.6), ),
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text("Non Profit Organization" + " " + index.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                      onTap: null,)),
                                            ),
                                                                                
                                         onTap: () {
                                                                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                        // return NewsDetail(imgList[index],headlines[index], newsdates[index]);}));                                  
                                     },                 
                                      );
                                  })

              
                                           
                                           
                                           ])
                                            ),
                                        ),
                                  onRefresh: () => refresh(),
                                     ),
                                 ),
                    );
                 }
}
