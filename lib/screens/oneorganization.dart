import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:expandable/expandable.dart';
import 'package:onecaintamobileapp/screens/oneorgdetails.dart';

//Models
import 'package:onecaintamobileapp/model/oneorganization.dart';

//Screens
import 'package:onecaintamobileapp/utility/loadingprogbar.dart';
import 'package:onecaintamobileapp/utility/loadfailedscreen.dart';

class OrgChart extends StatefulWidget {
 @override
 State<StatefulWidget> createState()  => _OrgChartState();
}

class _OrgChartState extends State<OrgChart> with TickerProviderStateMixin{


bool isLoading = false;

refresh() async{
  setState(() {
    
  });
}
  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "One Organization"),

                    body:Scrollbar(child:RefreshIndicator(
                    
                       child:  SingleChildScrollView(
                        child: FutureBuilder<List<OneOrgModel>>(
                                        future: fetchOrg(),
                                         builder: (context, snapshot) {
                                            if (snapshot.hasData) 
                                            {
                                                List<OneOrgModel> data = snapshot.data;
                                                return Container(
                                                          //height: MediaQuery.of(context).size.height,
                                                          child:Column(                  
                                                                children:  [
                                                                Padding(padding: EdgeInsets.only(top:10), child: ListTile(
                                                                      title:  Text("Cainta Municipal Government ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                                      subtitle: Text("Click each to expand on each office:", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                                      trailing: Icon(Icons.group,color:Colors.green[400], size:30) ,)),
                                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                                          Container( 
                                                              color:  Colors.transparent,
                                                                child: ListView.builder(
                                                                    physics: NeverScrollableScrollPhysics(),
                                                                    itemCount: data.length,
                                                                    shrinkWrap: true,
                                                                    itemBuilder: (BuildContext context, int index){
                                                                    return GestureDetector( child: 
                                                                    ExpandablePanel(
                                                                            header: Padding( padding: EdgeInsets.fromLTRB(15, 10, 0, 0), 
                                                                                      child:Text(data[index].municipalGovOffice, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                                                            expanded: Padding( padding: EdgeInsets.fromLTRB(10, 10, 0, 0), 
                                                                                      child:Card(                                
                                                                      clipBehavior: Clip.antiAlias,
                                                                      child: Column(
                                                                        children:[
                                                                          Row(children: [
                                                                            Expanded(
                                                                              flex:7,
                                                                              child: ListTile(
                                                                          title:  Padding(padding:EdgeInsets.fromLTRB(2,5,5,5), child:Text(data[index].municipalGovNames, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[600]))),
                                                                          subtitle: Padding(padding:EdgeInsets.all(5), child: Text(data[index].municipalGovDesc, //PREVIEW NEWS TEXT
                                                                            style: TextStyle(color: Colors.black.withOpacity(.8), fontWeight: FontWeight.bold,),
                                                                            overflow: TextOverflow.ellipsis,
                                                                            maxLines: 3
                                                                          ),),
                                                                        ),
                                                                        ),
                                                                        Expanded( 
                                                                          flex: 3,
                                                                        child:
                                                                        Padding( padding: EdgeInsets.only(top:10, right:10), child:Container(
                                                                              child: ClipRRect(
                                                                                borderRadius:  BorderRadius.circular(5.0),
                                                                                child: Image.network(data[index].municipalImg, fit: BoxFit.fitHeight, width: 150.0, height:75 ),
                                                                              ),
                                                                        )),)
                                                                    ],),  
                                                                        Row(children: [               
                          
                                                                            Spacer(),
                                                                                                              
                                                                        ButtonBar(
                                                                        alignment: MainAxisAlignment.start,
                                                                        buttonPadding: EdgeInsets.all(5),
                                                                        buttonMinWidth: 30,
                                                                        children: [ 
                                                                          InkWell(
                                                                                  onTap: () => true,
                                                                                  splashFactory: InkRipple.splashFactory,
                                                                                  highlightColor: Colors.blue[100],
                                                                                  child:Row( children: [ 
                                                                                    Text("See more info", style: TextStyle(color: Colors.black.withOpacity(.7))),
                                                                                    FlatButton(
                                                                            child: Icon(Icons.chevron_right_rounded, color: Colors.grey),
                                                                            onPressed: (){

                                                                                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                                                    return OneOrgDetails(data[index].municipalImg,data[index].municipalGovOffice, data[index].municipalGovNames, data[index].municipalGovDesc);}));               

                                                                            }
                                                                          ) 
                                                                        ])
                                                                        ),
                                                                        ],
                                                                        ),
                                                                        ]) 
                                                                      ])                
                                                                      ),
                                                                                      
                                                                      ),
                                                                  ),
                                                                onTap: () {
                                                                                                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                                                    return OneOrgDetails(data[index].municipalImg,data[index].municipalGovOffice, data[index].municipalGovNames, data[index].municipalGovDesc);}));                                  
                                                                    },                 
                                                                  );
                                                                })
                                                            ) 
                                                          ]));
                                          }
                                                      else if (snapshot.hasError) {
                                                return LoadFailedScreen();
                                            }

                                           return   LoadingProgBar();

                                         }),

                                        ),
                                  onRefresh: () => refresh(),
                                     ),
                                 ),
                    );
                 }
}
