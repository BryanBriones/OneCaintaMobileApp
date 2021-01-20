import 'package:flutter/material.dart';

//Components
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:onecaintamobileapp/components/jobs/jobsbannerimagewidget.dart';
import 'package:onecaintamobileapp/components/jobs/jobstitleinfo.dart';
import 'package:onecaintamobileapp/components/jobs/jobscontent.dart';


class JobsDetail extends StatefulWidget
{
  final String imgPath;
  final String jobheadline;
   final String salaryrange;
  final String date;
  JobsDetail(this.imgPath,this.jobheadline,this.date, this.salaryrange);
  @override
_JobsDetailState createState() => _JobsDetailState(this.imgPath,this.jobheadline,this.date, this.salaryrange);
 
}
@override
class _JobsDetailState extends State<JobsDetail>{
  final String imgPath;
  final String jobheadline;
   final String salaryrange;
  final String date;
  _JobsDetailState(this.imgPath,this.jobheadline,this.date, this.salaryrange);

   refresh() async {
  
    setState(() {
    
    });
  
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold( appBar: AppBarBackButtonWidget(40,"share",""),
     floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
                            height:100.0,
                            width: 200.0,
                            child: FittedBox( child:FloatingActionButton.extended(
                                                elevation: 40.0,
                                                icon: Icon(Icons.check_circle_rounded,color: Colors.white.withOpacity(0.9),),
                                                label:  Text("Apply for this job", style: TextStyle(color: Colors.white.withOpacity(0.9))),
                                                backgroundColor: Colors.green[500],
                                                onPressed: ()
                                                {
                                                      return null;

                                                
                                                }     
                                            
                          ))),
 
                    body:Scrollbar(child:RefreshIndicator(
                          child: SingleChildScrollView(
                          child:  Container(
                                                      decoration: BoxDecoration(
                                                     color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Column(mainAxisSize: MainAxisSize.max,
                                                                    children:[
                                                                              JobsBannerImageWidget(imgPath),
                                                                              JobsTitleInfoWidget(jobheadline,date, salaryrange),
                                                                              JobsContentWidget()
                                                                            ],
                                                                        ),
                                                                )
                                              ),
                              onRefresh: () => refresh() ,                
                                              )
     )
     
      );

  }



}
