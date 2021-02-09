import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';


//Models
import 'package:onecaintamobileapp/model/onedonationmodel.dart';

//Screens
import 'package:onecaintamobileapp/utility/loadingprogbar.dart';
import 'package:onecaintamobileapp/utility/loadfailedscreen.dart';

class OneDonation extends StatefulWidget {
 @override
 State<StatefulWidget> createState()  => _OneDonationState();
}

class _OneDonationState extends State<OneDonation> with TickerProviderStateMixin{


bool isLoading = false;

refresh() async{
  setState(() {
    
  });
}



  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "One Donation"),

                    body:Scrollbar(child:RefreshIndicator(
                    
                       child:  SingleChildScrollView(
                        child:  FutureBuilder<List<String>>(
                          future: getOneDonation() ,
                                         builder: (context, snapshot) {
                                            if (snapshot.hasData) 
                                            {
                                                    List<String>jsonStringResponse = snapshot.data;
                                                    List<OneDonationDriveModel> donationdrive;
                                                    List<OneDonationOrgModel> donationorg;

                                                    jsonStringResponse.forEach((jsonstring) { 

                                                       List jsonResponse = json.decode(jsonstring);

                                                        if (jsonResponse[0].containsKey("DonationID"))
                                                        {
                                                          
                                                           donationdrive = jsonResponse.map((item) => new OneDonationDriveModel.fromJson(item)).toList();
                                                        }
                                                        else if (jsonResponse[0].containsKey("BeneficiaryID"))
                                                        {
                                                           donationorg = jsonResponse.map((item) => new OneDonationOrgModel.fromJson(item)).toList();
                                                          
                                                        }



                                                    });
                                        
                                                return   Container(
                                                      //height: MediaQuery.of(context).size.height,
                                                      child:Column(                  
                                                            children:  [
                                                            Padding(padding: EdgeInsets.only(top:10), child: ListTile(
                                                                  title:  Text("Donation Drive", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                                  subtitle: Text("Where you can send donations, relief goods and financial assistance", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                                  trailing: Icon(Icons.favorite_outline_sharp,color:Colors.red[700], size:30) ,)),
                                                        Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),

                                                          ListView.builder(
                                                                physics: NeverScrollableScrollPhysics(),
                                                                itemCount: donationdrive.length,
                                                                shrinkWrap: true,
                                                                itemBuilder: (BuildContext context, int index){
                                                                  return GestureDetector( child: 
                                                                  InkWell(   //Icons.mobile_friendly_rounded, Icons.payments_rounded
                                                                              onTap: () => true,
                                                                                splashFactory: InkRipple.splashFactory,
                                                                                highlightColor: Colors.blue[100],
                                                                                child: GestureDetector(child:ListTile(
                                                                                leading: donationdrive[index].donationChannel == "LocationAddress"  ?  Icon(Icons.location_city_rounded,color: Colors.black.withOpacity(0.6), ) : 
                                                                                         donationdrive[index].donationChannel == "EPaymentBanks"  ?  Icon(Icons.mobile_friendly_rounded,color: Colors.black.withOpacity(0.6), ) :
                                                                                         donationdrive[index].donationChannel == "BankAccounts"   ?  Icon(Icons.payments_rounded,color: Colors.black.withOpacity(0.6), )     :
                                                                                        Icon(Icons.chevron_right_rounded,color: Colors.black.withOpacity(0.6), )                     ,
                                                                                title:  donationdrive[index].donationChannel == "LocationAddress"  ? 
                                                                                                  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text(donationdrive[index].donationChannelName + "\n\n" + donationdrive[index].donationChannelValue, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black) ),) :
                                                                                                  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text(donationdrive[index].donationChannelName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black) ),)  ,

                                                                                trailing: donationdrive[index].donationChannel == "LocationAddress"  ?  null :  Text(donationdrive[index].donationChannelValue, style: TextStyle( fontSize: 15, color: Colors.black)),
                                                                              
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
                                                                  title:  Text("Charities/Organization you helped", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                                  subtitle: Text("Here are the charitable organizations you will be helping:", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                                  trailing: Icon(Icons.favorite_outline_sharp,color:Colors.red[700], size:30) )),
                                                        Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                                        ListView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: donationorg.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (BuildContext context, int index){
                                                    return GestureDetector( child: 
                                                      InkWell(
                                                                  onTap: () => true,
                                                                  splashFactory: InkRipple.splashFactory,
                                                                  highlightColor: Colors.blue[100],
                                                                  child: GestureDetector(child:ListTile(
                                                                  leading: Icon(Icons.business_rounded,color: Colors.black.withOpacity(0.6), ),
                                                                  title:  Padding(padding:EdgeInsets.fromLTRB(2,10,5,5), child:Text(donationorg[index].beneficiaryName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black))),
                                                                  onTap: null,)),
                                                        ),
                                                                                            
                                                    onTap: () {
                                                                                    // Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                                    // return NewsDetail(imgList[index],headlines[index], newsdates[index]);}));                                  
                                                },                 
                                                  );
                                              })         
                                            ])
                                            );
                                        
                                          }
                                             else if (snapshot.hasError) {
                                                return LoadFailedScreen();
                                            }

                                           return   LoadingProgBar();
                                         }),
                                     ),
                                    onRefresh: () => refresh(),
                                 ),
                    )
                    );
                 }
}
