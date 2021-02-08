
import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:intl/intl.dart';

//Models
import 'package:onecaintamobileapp/model/jobsopeningmodel.dart';

//Screens
import 'package:onecaintamobileapp/screens/jobdetails.dart';
import 'package:onecaintamobileapp/utility/loadingprogbar.dart';
import 'package:onecaintamobileapp/utility/loadfailedscreen.dart';


import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';


class JobOpening extends StatefulWidget {
  JobOpening();
 @override
 State<StatefulWidget> createState() {
    return _JobOpeningState();
  }
}

class _JobOpeningState extends State<JobOpening> {

// List<String> imgList = [
//   'assets/caintalogo.png',
// 'assets/caintalogo.png',
// 'assets/caintalogo.png',
// 'assets/caintalogo.png',
// 'assets/caintalogo.png',
//  'assets/caintalogo.png'
// ]; 
//  List<String> jobHeadlines = [
//   'Municipal Staff',
//   'Municipal Manager',
//   'Janitor',
//   'Office Staff',
//   'Encoder',
//   'Cashier'
// ]; 

// List<String> jobSalaryRange = [
//   'PHP 15000-20000',
//   'PHP 25000-30000',
//   'PHP 13000-15000',
//   'PHP 15000-20000',
//   'PHP 15000-20000',
//   'PHP 15000-20000',
// ]; 
String formatDate(DateTime date) => new DateFormat("MMMM dd, yyyy").format(date);

//String dateSlug ="${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}-${DateTime.now().year.toString()}";
 //List<String> jobdates;

_JobOpeningState();
bool IsRefresh = false;
bool isLoading = false;

  refresh() async {

    setState(() {
        
        });
  }
  void initState() {
    super.initState();
    
 // jobdates = [dateSlug,dateSlug,dateSlug,dateSlug,dateSlug,dateSlug]; 

  }


  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "Job Openings"),

                    body:Scrollbar(child:RefreshIndicator(
                       child:  SingleChildScrollView(
                        child:  FutureBuilder<List<JobsOpeningModel>>(
                            future: fetchJobs(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) 
                              {
                                  List<JobsOpeningModel> data = snapshot.data;
                                  return Container(
                                                  color: Colors.transparent,
                                                  child:
                                                  ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              itemCount: data.length,
                                              shrinkWrap: true,
                                              itemBuilder: (BuildContext context, int index){
                                                return GestureDetector( child: 
                                                Card(                                
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Column(
                                                    children:[
                                                      Row(children: [
                                                        Expanded(
                                                          flex:7,
                                                          child: ListTile(
                                                      title:  Padding(padding:EdgeInsets.fromLTRB(2,5,5,5), child:Text(data[index].jobHeadline, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                                      subtitle: Padding(padding:EdgeInsets.all(5), child: Text('PHP ' + data[index].jobSalaryLow.toString() + ' - ' + data[index].jobSalaryHigh.toString(),//SALARY RANGE
                                                        style: TextStyle(color: Colors.blueAccent.withOpacity(.7), fontWeight: FontWeight.bold),
                                                      ),),
                                                    ),
                                                    ),
                                                    Expanded( 
                                                      flex: 3,
                                                    child:
                                                    Padding( padding: EdgeInsets.only(top:10, right:10), child:Container(
                                                          child: ClipRRect(
                                                            borderRadius:  BorderRadius.circular(5.0),
                                                            child: Image.network(data[index].jobImg, fit: BoxFit.fitHeight, width: 150.0, height:75 ),
                                                          ),
                                                    )),)
                                                ],),  
                                                    Row(children: [               
                                                      Row(children: [
                                                            Padding(padding:EdgeInsets.only(left:20,right:5), child:Icon(Icons.calendar_today_rounded, size:15, color:  Colors.black.withOpacity(0.6),)),
                                                            Text( formatDate(DateTime.parse(data[index].jobDatePosting)),style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                                                            ]),
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
                                                                Text("Apply for this job", style: TextStyle(color: Colors.black.withOpacity(.7))),
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
                                                onTap: () {
                                                                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                                return JobsDetail(data[index].jobImg,data[index].jobHeadline, data[index].jobDatePosting, data[index].jobSalaryLow,  data[index].jobSalaryHigh,  data[index].jobDescText);}));                                  
                                            },                 
                                              );
                                          })
                                                  
                                      );
                              
                              }
                               else if (snapshot.hasError) {
                                                return LoadFailedScreen();
                              }

                               return   LoadingProgBar();
                            })
                                        ),
                                                 onRefresh: () => refresh(),
                                  ),

                            ),
                    );
                 }
}
