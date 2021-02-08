import 'package:flutter/material.dart';


//Models
import 'package:onecaintamobileapp/model/newsmodel.dart';

//Components
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';
import 'package:onecaintamobileapp/components/news/newsbannerimagewidget.dart';
import 'package:onecaintamobileapp/components/news/newstitleinfo.dart';
import 'package:onecaintamobileapp/components/news/newscontent.dart';


class NewsDetail extends StatefulWidget
{
  final String imgPath;
  final String headline;
  final String date;
  final String newsbody;
  NewsDetail(this.imgPath,this.headline,this.date, this.newsbody);
  @override
_NewsDetailState createState() => _NewsDetailState(this.imgPath,this.headline,this.date,this.newsbody);
 
}
@override
class _NewsDetailState extends State<NewsDetail>{
   String imgPath;
  String headline;
  String date;
  String newsbody;
  _NewsDetailState(this.imgPath,this.headline,this.date,this.newsbody);

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
                                                                              NewsBannerImageWidget(imgPath),
                                                                              NewsTitleInfoWidget(headline,date),
                                                                              NewsContentWidget(newsbody)
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
