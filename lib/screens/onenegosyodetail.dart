import 'package:flutter/material.dart';

//Components
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:onecaintamobileapp/components/onenegosyo/onenegosyobannerimagewidget.dart';
import 'package:onecaintamobileapp/components/onenegosyo/onenegosyotitleinfo.dart';
import 'package:onecaintamobileapp/components/onenegosyo/onenegosyocontent.dart';


class OneNegosyoDetail extends StatefulWidget
{
  final String imgPath;
  final String businessname;
  final String businessCategories;
  final String businessLocation;
  final String openHours;
  final String closeHours;
  final String businessDays;
  final String businessDesc;
  final String contactdetail;

  OneNegosyoDetail(this.imgPath,this.businessname,this.businessCategories,this.businessLocation, this.openHours, this.closeHours, this.businessDays, this.businessDesc, this.contactdetail);
  @override
_OneNegosyoDetailState createState() => _OneNegosyoDetailState(this.imgPath,this.businessname,this.businessCategories,this.businessLocation, this.openHours, this.closeHours, this.businessDays, this.businessDesc,  this.contactdetail);
 
}
@override
class _OneNegosyoDetailState extends State<OneNegosyoDetail>{

   String imgPath;
   String businessname;
   String businessCategories;
   String businessLocation;
   String openHours;
   String closeHours;
   String businessDays;
   String businessDesc;
   String contactdetail;

  _OneNegosyoDetailState(this.imgPath,this.businessname,this.businessCategories,this.businessLocation, this.openHours, this.closeHours, this.businessDays, this.businessDesc, this.contactdetail);

   refresh() async {
  
    setState(() {
    
    });
  
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold( appBar: AppBarBackButtonWidget(40,"share",""),
 
                    body:Scrollbar(child:RefreshIndicator(
                          child: SingleChildScrollView(
                          child:  Container(
                                                      decoration: BoxDecoration(
                                                     color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                      child:  Column(mainAxisSize: MainAxisSize.max,
                                                                    children:[
                                                                              OneNegosyoBannerImageWidget(imgPath),
                                                                              OneNegosyoTitleInfoWidget(businessname,businessCategories,businessLocation,openHours,closeHours,businessDays, contactdetail),
                                                                              OneNegosyoContentWidget(businessDesc)
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
