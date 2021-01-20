import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:expandable/expandable.dart';


//Models

class PoliciesGuidelines extends StatefulWidget {
 @override
 State<StatefulWidget> createState()  => _PoliciesGuidelinesState();
}

class _PoliciesGuidelinesState extends State<PoliciesGuidelines> with TickerProviderStateMixin{


bool isLoading = false;

Future<void> refresh(){
  setState(() {
    
  });
}



  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "Policies and Guidelines"),

                    body:Scrollbar(child:RefreshIndicator(
                    
                       child:  SingleChildScrollView(
                        child: Container(
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
                                      itemCount: 7,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, int index){
                                        return GestureDetector( child: ExpandablePanel(
                                                header: Padding( padding: EdgeInsets.fromLTRB(10, 10, 0, 0), 
                                                          child:Text("Sample FAQ" + " " + index.toString() + "?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                                expanded: Padding( padding: EdgeInsets.fromLTRB(10, 10, 0, 0), 
                                                          child:Text("SampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBodySampleBody", softWrap: true, )),
                                              ),
                                                                                
                                         onTap: () {
                                                                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                        // return NewsDetail(imgList[index],headlines[index], newsdates[index]);}));                                  
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
