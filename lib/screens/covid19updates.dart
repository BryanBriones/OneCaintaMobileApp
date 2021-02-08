//Flutter Material Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

//Screens
import 'package:onecaintamobileapp/screens/newsdetail.dart';

class COVID19Update extends StatefulWidget
{
  COVID19Update();
_COVID19UpdateState createState() => _COVID19UpdateState();
 
}
@override
class _COVID19UpdateState extends State<COVID19Update> {
//bool isLoading=false;
 // Future<List<Supplier>> data;
   List<Widget> imageSliders;
   int _current = 0;

List<String> imgList = [
  'https://scontent.fcrk1-2.fna.fbcdn.net/v/t1.15752-9/137095700_771808907022106_3074579628451551195_n.jpg?_nc_cat=106&ccb=2&_nc_sid=ae9488&_nc_eui2=AeF-CaYlWVFRoD2cWyUOMRnHK_SfwQTMDbUr9J_BBMwNtVqiDlrSga4eqqnNsf2RuXPALK5pWl2qh15yRuKWxFdG&_nc_ohc=5vM15pBxDzYAX-iSDyE&_nc_ht=scontent.fcrk1-2.fna&oh=937aa46d6fe6f87aaf204e284b519fe3&oe=6022BEB3',
  'https://scontent.fcrk1-2.fna.fbcdn.net/v/t1.15752-9/136709742_1832612540243144_2878654716401385129_n.jpg?_nc_cat=101&ccb=2&_nc_sid=ae9488&_nc_eui2=AeFQ2gc68yCSbn3-c3Y_x38k5oiVEXSCukTmiJURdIK6RNMTMTH96UmNQ9VYg9UkbOJ0KGySv9_RF1jFxxTuovJU&_nc_ohc=oKjDzLBISdQAX-nYQgY&_nc_oc=AQn0m1W_Up-4hkyN_eUOycnfq0k6U5LNRPbiO-licV7CNi_kvHDFbkt8FrTIlSYFrjQ&_nc_ht=scontent.fcrk1-2.fna&oh=a0e5f7e5e2df68fe48b5a31292faaa4d&oe=602594D7',
  'https://scontent.fcrk1-2.fna.fbcdn.net/v/t1.15752-9/138274904_221716876220921_563950685805933190_n.jpg?_nc_cat=110&ccb=2&_nc_sid=ae9488&_nc_eui2=AeFu6UrkcswtfK4KyLJhqwqFXcWNwEvqCDddxY3AS-oIN1NoXpxDnl4c0xj44ukQl05ZitFNcc1fJ8N_ELtrigdx&_nc_ohc=gOF9gyevz3QAX8i7J5r&_nc_ht=scontent.fcrk1-2.fna&oh=407f9029d3d5177723b6ebca34fe6938&oe=602287D8',
  'https://scontent.fcrk1-2.fna.fbcdn.net/v/t1.15752-9/136995717_2786478518293899_2691940109663959489_n.jpg?_nc_cat=110&ccb=2&_nc_sid=ae9488&_nc_eui2=AeG-JzN5D7o9Lc17Z3kUfO3QIMGZMt3ElfYgwZky3cSV9vC4IdFkjRAJ5qHYQ87hAB5NBgUE7zG44YlT8px1nHOc&_nc_ohc=QDvOb1TU4QkAX9XlxG2&_nc_ht=scontent.fcrk1-2.fna&oh=e4f210b4682afe8565cbec10e1a5bb08&oe=6026329B',
  'https://scontent.fcrk1-2.fna.fbcdn.net/v/t1.15752-9/137222609_1157240161387428_6679744128542327879_n.jpg?_nc_cat=102&ccb=2&_nc_sid=ae9488&_nc_eui2=AeGsUki0A2_6o1UjU-8BH5ozc72VpIAQjVxzvZWkgBCNXMZGg2SEyP4Shz3KkrYKGJUohoaYy4xORvf2NjziGNT9&_nc_ohc=yMt4l3NLe30AX9CFN2B&_nc_ht=scontent.fcrk1-2.fna&oh=89870bea8e4caeae8dc11250979f960f&oe=60250374',
  'https://scontent.fcrk1-2.fna.fbcdn.net/v/t1.15752-9/137310740_443865946983596_3886238256666170430_n.jpg?_nc_cat=111&ccb=2&_nc_sid=ae9488&_nc_eui2=AeHaJEY5MC9oWBcaiOUzTM_qjHJzn7i4TjmMcnOfuLhOOSpMPG_LSIz4ZyQBFXSrXC6cbVOQ1tsxhRsnQEUXphPD&_nc_ohc=A0TZ0UNa4yYAX9gOhCJ&_nc_ht=scontent.fcrk1-2.fna&oh=8645632ce31943488aefa7528d6cef23&oe=60264617'
]; 
 List<String> headlines = [
  'COVID-19 Cases Update..',
  'COVID-19 Patient Updates..',
  'COVID-19 Patient Updates..',
  'COVID-19 Patient Updates..',
  'COVID-19 Patient Updates..',
  'COVID-19 Patient Updates..'
]; 
String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);

String dateSlug ="${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}-${DateTime.now().year.toString()}";
 List<String> newsdates;
 _COVID19UpdateState();
@override
  void initState() {
    super.initState();

 newsdates = [dateSlug,dateSlug,dateSlug,dateSlug,dateSlug,dateSlug]; 
 imageSliders = imgList.map((item) { 
        return GestureDetector( child: Container(
          child: Container(
           margin: EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0, height:1000 ),
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
                        headlines[imgList.indexOf(item)],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ), Row(children: [
                        Align(alignment: FractionalOffset.bottomLeft , child: Padding( padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0, top:5.0), child: Icon(Icons.calendar_today_rounded, size:15, color:  Colors.white,))),
                        Text(
                        newsdates[imgList.indexOf(item)],
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
                  return NewsDetail(imgList[imgList.indexOf(item)],headlines[imgList.indexOf(item)], newsdates[imgList.indexOf(item)], headlines[imgList.indexOf(item)]);})); 

        },
        );}
        ).toList(); 
      
  }                                                            
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
                    child: 
                     NotificationListener<ScrollNotification>(
                                      onNotification: (_) => true,
                                      child: Column( children:[
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
        children: imgList.map((item) { 
         int index=imgList.indexOf(item);  
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
                                      itemCount: 6,
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
                                              title:  Padding(padding:EdgeInsets.fromLTRB(2,5,5,5), child:Text(headlines[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                              subtitle: Padding(padding:EdgeInsets.all(5), child:Text('Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor', //PREVIEW NEWS TEXT
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
                                                    child: Image.network(imgList[index], fit: BoxFit.cover, width: 150.0, height:100 ),
                                                  ),
                                            )),)
                                        ],),  
                                             Row(children: [               
                                               Row(children: [
                                                     Padding(padding:EdgeInsets.only(left:20,right:5), child:Icon(Icons.calendar_today_rounded, size:15, color:  Colors.black.withOpacity(0.6),)),
                                                    Text( newsdates[index],style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),),
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
                                                                        return NewsDetail(imgList[index],headlines[index], newsdates[index], headlines[index]);}));                                  
                                     },                 
                                      );
                                  })
                   ) 
    ]),    
    ),                                    
    );
  }
}

