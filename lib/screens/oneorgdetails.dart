import 'package:flutter/material.dart';

//Components
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:onecaintamobileapp/components/oneorg/oneorgbannerimagewidget.dart';
import 'package:onecaintamobileapp/components/oneorg/oneorgtitleinfo.dart';
import 'package:onecaintamobileapp/components/oneorg/oneorgcontent.dart';





class OneOrgDetails extends StatefulWidget
{
  final String imgPath;
  final String office;
   final String govOfficial;
  final String govDesc;
  OneOrgDetails(this.imgPath,this.office,this.govOfficial, this.govDesc);
  @override
_OneOrgDetailsState createState() => _OneOrgDetailsState(this.imgPath,this.office,this.govOfficial, this.govDesc);
 
}
@override
class _OneOrgDetailsState extends State<OneOrgDetails>{
  final String imgPath;
  final String office;
   final String govOfficial;
  final String govDesc;
  _OneOrgDetailsState(this.imgPath,this.office,this.govOfficial, this.govDesc);

   refresh() async {
  
    setState(() {
    
    });
  
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold( appBar: AppBarBackButtonWidget(40,"none",""),
                    body:Scrollbar(child:RefreshIndicator(
                          child: SingleChildScrollView(
                          child:  Container(
                                                      decoration: BoxDecoration(
                                                     color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Column(mainAxisSize: MainAxisSize.max,
                                                                    children:[
                                                                              OneOrgBannerImageWidget(imgPath),
                                                                              OneOrgTitleInfoWidget(govOfficial, office),
                                                                              OneOrgContentWidget(govDesc)
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
