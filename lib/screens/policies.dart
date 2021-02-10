import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:expandable/expandable.dart';


//Models
import 'package:onecaintamobileapp/model/policiesmodel.dart';

//Screens
import 'package:onecaintamobileapp/utility/loadingprogbar.dart';
import 'package:onecaintamobileapp/utility/loadfailedscreen.dart';


class PoliciesGuidelines extends StatefulWidget {
 @override
 State<StatefulWidget> createState()  => _PoliciesGuidelinesState();
}

class _PoliciesGuidelinesState extends State<PoliciesGuidelines> with TickerProviderStateMixin{


bool isLoading = false;

refresh() async{
  setState(() {
    
  });
}



  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "Policies and Guidelines"),

                    body:Scrollbar(child:RefreshIndicator(
                       child:  SingleChildScrollView(
                        child: FutureBuilder<List<PolicyModel>>(
                          future: fetchPolicies(),
                          builder: (context, snapshot) {
                                if (snapshot.hasData) 
                                {
                                  List<PolicyModel> data = snapshot.data;

                                  return  Container(
                                           //height: MediaQuery.of(context).size.height,
                                           child:Column(                  
                                                children:  [
                                                Padding(padding: EdgeInsets.only(top:10), child: ListTile(
                                                      title:  Text("Cainta FAQs, Policies and Guidelines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue[900])),
                                                      subtitle: Text("Click each to expand on each FAQs:", style: TextStyle(color: Colors.black.withOpacity(0.6))),
                                                      trailing: Icon(Icons.contact_support_rounded,color:Colors.green[400], size:30) ,)),
                                            Padding(padding: EdgeInsets.only(top:10), child: Divider( color: Colors.grey.withOpacity(0.6))),
                                           Container( 
                                            color:  Colors.transparent,
                                              child: ListView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: data.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (BuildContext context, int index){
                                                    return GestureDetector( child: ExpandablePanel(
                                                            header: Padding( padding: EdgeInsets.fromLTRB(10, 10, 0, 0), 
                                                                      child:Text(data[index].question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                                            expanded: Padding( padding: EdgeInsets.fromLTRB(10, 10, 0, 0), 
                                                                      child:Text(data[index].answerBody.replaceAll(r'\n', '\n'), softWrap: true, )),
                                                          ),                                 
                                                        onTap: () {
                                                                                    // Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                                    // return NewsDetail(imgList[index],headlines[index], newsdates[index]);}));                                  
                                                                    },                 
                                                          );
                                                      })
                                                ) 
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
                        ),
                    );
                 }
}
