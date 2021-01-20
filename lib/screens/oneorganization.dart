import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:expandable/expandable.dart';
import 'package:onecaintamobileapp/screens/oneorgdetails.dart';

//Models

class OrgChart extends StatefulWidget {
 @override
 State<StatefulWidget> createState()  => _OrgChartState();
}

class _OrgChartState extends State<OrgChart> with TickerProviderStateMixin{


bool isLoading = false;

Future<void> refresh(){
  setState(() {
    
  });
}
List<String> municipalGovOffice = ["The Mayor", "The Vice Mayor", "Sangguniang Bayan", "Barangay - Sto. Domingo", "Barangay - San Andres", "Barangay - San Juan", "Barangay - San Isidro", "Barangay - San Roque", "Barangay - Sto Nino", "Barangay - Santa Rosa"];
List<String> municipalGovNames = ["Johnielle Keith “Kit” Pasion Nieto", "The Vice Mayor", "Councilors Names", "Barangay - Sto. Domingo", "Barangay - San Andres", "Barangay - San Juan", "Barangay - San Isidro", "Barangay - San Roque", "Barangay - Sto Nino", "Barangay - Santa Rosa"];
List<String> municipalGovDesc = ["Johnielle Keith “Kit” Pasion Nieto is a Filipino lawyer and politician currently serving as the Mayor of Cainta, Rizal. He ran for mayoralty during 2013 elections and was proclaimed winner, beating Veron Ilagan [Nationalist People’s Coalition], wife of former Mayor Mon Ilagan. He ran again this 2016 elections and won his 2nd term via a landslide victory. Under his administration, Cainta is experiencing a resurgence in almost all positive aspects of the municipality. From Countless public service projects, continuous municipal income growth, influx of new businesses and investors, hands-on administration, plus sincerely reaching out to all his constituents. This renaissance has attracted a flooding of volunteers and believers for change to Cainteños from all walks of life like those who are awe-struck with what Cainta has achieved in such a very short time. Truly embracing the tag line: ONE CAINTA! Delivering the best no-nonsense public service and growth that Cainta has never ever seen before.Studied at Ateneo de Manila University for his Law DegreeCollege: AB Political Science at Ateneo de Manila University High school: to Ateneo de Manila High School", "The Vice Mayor", "Councilors Names", "Barangay - Sto. Domingo", "Barangay - San Andres", "Barangay - San Juan", "Barangay - San Isidro", "Barangay - San Roque", "Barangay - Sto Nino", "Barangay - Santa Rosa"];

List<String> imgList = [
 'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
 'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
  'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
   'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
    'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
     'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
      'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
       'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
        'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
         'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D'
]; 
  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "One Organization"),

                    body:Scrollbar(child:RefreshIndicator(
                    
                       child:  SingleChildScrollView(
                        child: Container(
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
                                                    itemCount: municipalGovOffice.length,
                                                    shrinkWrap: true,
                                                    itemBuilder: (BuildContext context, int index){
                                                    return GestureDetector( child: 
                                                    ExpandablePanel(
                                                            header: Padding( padding: EdgeInsets.fromLTRB(15, 10, 0, 0), 
                                                                      child:Text(municipalGovOffice[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                                            expanded: Padding( padding: EdgeInsets.fromLTRB(10, 10, 0, 0), 
                                                                      child:Card(                                
                                                      clipBehavior: Clip.antiAlias,
                                                      child: Column(
                                                        children:[
                                                          Row(children: [
                                                            Expanded(
                                                              flex:7,
                                                              child: ListTile(
                                                          title:  Padding(padding:EdgeInsets.fromLTRB(2,5,5,5), child:Text(municipalGovNames[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[600]))),
                                                          subtitle: Padding(padding:EdgeInsets.all(5), child: Text(municipalGovDesc[index], //PREVIEW NEWS TEXT
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
                                                                child: Image.network(imgList[index], fit: BoxFit.fitHeight, width: 150.0, height:75 ),
                                                              ),
                                                        )),)
                                                    ],),  
                                                        Row(children: [               
                                                          // Row(children: [
                                                          //       Padding(padding:EdgeInsets.only(left:20,right:5), child:Icon(Icons.calendar_today_rounded, size:15, color:  Colors.black.withOpacity(0.6),)),
                                                          //       Text( jobdates[index],style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                                                          //       ]),
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
                                                            onPressed: null
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
                                                                                    return OneOrgDetails(imgList[index],municipalGovOffice[index], municipalGovNames[index], municipalGovDesc[index]);}));                                  
                                                    },                 
                                                  );
                                                })
                                             ) 
                                           ])
                                            ),
                                        ),
                                  onRefresh: () => refresh(),
                                     ),
                                 ),
                    );
                 }
}
