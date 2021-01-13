//Flutter Material Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

//Screens
import 'package:onecaintamobileapp/screens/newsdetail.dart';

class News extends StatefulWidget
{
  News();
_NewsState createState() => _NewsState();
 
}
@override
class _NewsState extends State<News> {
//bool isLoading=false;
 // Future<List<Supplier>> data;
   List<Widget> imageSliders;
   int _current = 0;
//    List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ]; 
List<String> imgList = [
  'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136346268_10221399574517531_2283841990153792062_o.jpg?_nc_cat=106&ccb=2&_nc_sid=730e14&_nc_eui2=AeG6rx9Q6ITFrPPlf1wMVBdtzAt9edSgs2TMC3151KCzZArX2rCER1T88AmFd0D-PzBJBtx2kLAPU8MC4ynvl7Cq&_nc_ohc=Ncu0soLdCoAAX9MBFM3&_nc_ht=scontent.fmnl9-1.fna&oh=1ed003c1fb425291b08fe954196473f6&oe=6022565F',
  'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136074238_10221399744041769_2595715818862734329_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeFTn8Ts8KXXIj_RzQYxgJGek4_fF4Q-Dy2Tj98XhD4PLYeWPca8iLXW1klqBLSO0FV0zTMVzm-L3cDMJjyWNi3P&_nc_ohc=acXe0kgcLc4AX-mUCOd&_nc_ht=scontent.fmnl9-1.fna&oh=f91734a937de325b09cc47c21e24571a&oe=60218F9D',
  'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136459939_10221411577337594_4929433602683692607_o.jpg?_nc_cat=104&ccb=2&_nc_sid=730e14&_nc_eui2=AeEwX2ZOrKlyU5cPYSRIadTkVuYdyzfYhOVW5h3LN9iE5ahyVnSTkGv9iBje-eST8FasOud7LaVaRwBWRAFX7gIn&_nc_ohc=qoPRDcre-dYAX9dxn2p&_nc_ht=scontent.fmnl9-1.fna&oh=58c925e1e0ad9453a7fd855ff2ecfcbf&oe=602341DB',
  'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/137080859_10221431931806443_3021646390290378782_o.jpg?_nc_cat=104&ccb=2&_nc_sid=730e14&_nc_eui2=AeHwOwb16eWsZ5rIT4r14vbp8YhPMMtXW4zxiE8wy1dbjGzLw40I9QKngt0xnzD_3Auo4FXPhvw4qEvBpE3OQ1tq&_nc_ohc=RpGZssMneYkAX-JW-MY&_nc_ht=scontent.fmnl9-1.fna&oh=9e5e3698e6501f012522655805baa7e4&oe=60219A10',
  'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/136749181_10160899986584698_2639761650014353933_n.jpg?_nc_cat=100&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeGov29tWqkFR4SSpgep77-_t54ixhR3eIS3niLGFHd4hP4lY8nDB7a6epdWRRGAI7ReM9yjET2l-iKC3GeEqkYt&_nc_ohc=oVLfLKaionAAX91n0Lb&_nc_ht=scontent.fmnl9-1.fna&oh=213c5932616921bb599a4de7da2fccdd&oe=60235774',
  'https://scontent.fmnl9-1.fna.fbcdn.net/v/t1.0-9/135891415_10221412708005860_398892527760001295_n.jpg?_nc_cat=108&ccb=2&_nc_sid=8bfeb9&_nc_eui2=AeEBRpjG4nCpLuELT3GqP66tMcej_K6D9Ucxx6P8roP1R2lgEsu_FJmDtlp4NA-lVHdtlDob9d7D0wmE2ZStgad-&_nc_ohc=SMtv4CsLLx8AX-Pcjar&_nc_ht=scontent.fmnl9-1.fna&oh=3a797e7019c2ef4f689403c2c7c578f0&oe=6023119E'
]; 
 List<String> headlines = [
  'Road Widening sa A Bonifacio Avenue, nagsimula na..',
  'Handa na ang Cainta sa COVID19 vaccines..',
  'Bagong streelights, naipakabit sa Brgy. Sta Rosa..',
  'Tricot creek cleanup, isinagawa..',
  'Cainta Business One Stop Shop, ipinatupad..',
  'Mayor Nieto nagbigay ng ayuda para sa Cainta..'
]; 
String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);

String dateSlug ="${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}-${DateTime.now().year.toString()}";
 List<String> newsdates;
 _NewsState();
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
                  return NewsDetail(imgList[imgList.indexOf(item)],headlines[imgList.indexOf(item)], newsdates[imgList.indexOf(item)]);})); 

        },
        );}
        ).toList(); 
      
  }                                                            
  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: SingleChildScrollView(
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
                                                                        return NewsDetail(imgList[index],headlines[index], newsdates[index]);}));                                  
                                     },                 
                                      );
                                  })
                   ) 
    ]),    
    ),        
    ),                            
    );
  }
}

