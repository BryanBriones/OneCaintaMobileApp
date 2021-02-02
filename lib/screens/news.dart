//Flutter Material Imports
import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

//Models
import 'package:onecaintamobileapp/model/newsmodel.dart';

//Screens
import 'package:onecaintamobileapp/screens/newsdetail.dart';
import 'package:onecaintamobileapp/utility/loadingprogbar.dart';
import 'package:onecaintamobileapp/utility/loadfailedscreen.dart';

class News extends StatefulWidget
{
  News();
_NewsState createState() => _NewsState();
 
}
@override
class _NewsState extends State<News> {
//bool isLoading=false;

List<Widget> imageSliders;  
 int _current = 0;


String formatDate(DateTime date) => new DateFormat("MMMM dd, yyyy").format(date);

 _NewsState();
@override

  void initState() {
    super.initState();
      
  }
 @override
void dispose() {
 super.dispose();
}


 refresh() async {
  
    setState(() {
       
       
    });
  
  }


 void loadNewsFeature(List<NewsModel> data) 
    {
  

       imageSliders = data.map((item) { 
        return GestureDetector( child: Container(
          child: Container(
           margin: EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item.headlineImg, fit: BoxFit.cover, width: 1000.0, height:1000 ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Column( children: [ Text(
                        item.headline, maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ), Row(children: [
                        Align(alignment: FractionalOffset.bottomLeft , child: Padding( padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0, top:5.0), child: Icon(Icons.calendar_today_rounded, size:15, color:  Colors.white,))),
                        Text(
                        formatDate(DateTime.parse(item.newsdate)),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                           fontWeight: FontWeight.bold,
                        ),
                       )
                      ])
                      ,],)
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return NewsDetail(item.headlineImg,item.headline, item.newsdate);})); 

        },
        );}
        ).toList(); 

    }
                                                          
  @override
  Widget build(BuildContext context) {
    return   RefreshIndicator(  
                                                         child:SingleChildScrollView(child:NotificationListener<ScrollNotification>(
                                      onNotification: (_) => true,
                                      child: FutureBuilder<List<NewsModel>>(
                                        future: fetchNews(),
                                         builder: (context, snapshot) {
                                            if (snapshot.hasData) 
                                            {
                                              List<NewsModel> data = snapshot.data;
                                              loadNewsFeature(data);
                                              return Column( children:[
                                                                                    CarouselSlider(
                                                                            options: CarouselOptions(
                                                                              autoPlay: true,
                                                                              aspectRatio: 2.0,
                                                                              enlargeCenterPage: true,
                                                                              height: 250,
                                                                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                                                                              autoPlayAnimationDuration: Duration(milliseconds: 1000),
                                                                              autoPlayInterval: Duration(seconds: 5),
                                                                              onPageChanged: (index,imageSliders)
                                                                              {
                                                                                                    setState(() {
                                                                                  _current = index;

                                                                                });
                                                                              },
                                                                              
                                                                            ),
                                                                            
                                                                            items: imageSliders
                                                            ),
                                                        //carousel dot indicators
                                                          Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: data.map((item) { 
                                                          int index=data.indexOf(item);  
                                                              return Container(
                                                                width: 8.0,
                                                                height: 8.0,
                                                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    color: _current == index
                                                                        ? Color.fromRGBO(0, 0, 0, 0.9)
                                                                        : Color.fromRGBO(0, 0, 0, 0.4)),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                        //NewsHeaders
                                                        Row(
                                                          children: [
                                                                        Expanded(child:
                                                                                  Container (
                                                                                    color: Colors.transparent,
                                                                                    padding: EdgeInsets.only(left:5, top:5, bottom:15),
                                                                                    child:Text(
                                                                                    "Mga Balita Ngayon..",
                                                                                  style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, ),
                                                                                  
                                                                                  ) 
                                                                                  ),
                                                                      ),
                                                                      ]),
                                                              
                                                            Container( 
                                                                  color:  Colors.transparent,
                                                                    child: ListView.builder(
                                                                                        physics: NeverScrollableScrollPhysics(),
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
                                                                                                title:  Padding(padding:EdgeInsets.fromLTRB(2,5,5,5), child:Text(data[index].headline,  maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                                                                                subtitle: Padding(padding:EdgeInsets.all(5), child:Text(data[index].newsPreview, maxLines: 3, overflow: TextOverflow.ellipsis, //PREVIEW NEWS TEXT
                                                                                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                                                                                ),),
                                                                                              ),
                                                                                              ),
                                                                                              Expanded( 
                                                                                                flex: 3,
                                                                                              child:
                                                                                              Padding( padding: EdgeInsets.only(top:10, right:10), child:Container(
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius:  BorderRadius.circular(5.0),
                                                                                                      child: Image.network(data[index].headlineImg, fit: BoxFit.cover, width: 150.0, height:100 ),
                                                                                                    ),
                                                                                              )),)
                                                                                          ],),  
                                                                                              Row(children: [               
                                                                                                Row(children: [
                                                                                                      Padding(padding:EdgeInsets.only(left:20,right:5), child:Icon(Icons.calendar_today_rounded, size:15, color:  Colors.black.withOpacity(0.6),)),
                                                                                                      Text( formatDate(DateTime.parse(data[index].newsdate)),style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),),
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
                                                                                                        child:  FlatButton(child: Icon(Icons.favorite_rounded, color: Colors.grey),
                                                                                                  onPressed: null) ,
                                                                                                  ),
                                                                                                InkWell(
                                                                                                        onTap: () => true,
                                                                                                        splashFactory: InkRipple.splashFactory,
                                                                                                        highlightColor: Colors.blue[100],
                                                                                                        child:FlatButton(
                                                                                                  child: Icon(Icons.share_rounded, color: Colors.grey),
                                                                                                  onPressed: null
                                                                                                )
                                                                                              ),
                                                                                              ],
                                                                                              ),
                                                                                              ]) 
                                                                                            ])                
                                                                                            ),
                                                                                          onTap: () {
                                                                                                                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                                                                         return NewsDetail(data[index].headlineImg,data[index].headline, data[index].newsdate);}));                                  
                                                                                      },    
                                                                                                   
                                                                                        );
                                                                                    })
                                                                    ) 
                                                          ]); 
                                            }
                                             
                                             else if (snapshot.hasError) {
                                                return LoadFailedScreen();
                                            }

                                           return   LoadingProgBar();
                                                                   
                                                                  

                                         }),
    )                                                   
    ),
    onRefresh: () =>    refresh()

    );
  }
}

