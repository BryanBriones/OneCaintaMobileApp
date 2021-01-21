//Flutter Material Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

//Screens
import 'package:onecaintamobileapp/screens/onenegosyodetail.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';

class OneNegosyo extends StatefulWidget
{
  OneNegosyo();
_OneNegosyoState createState() => _OneNegosyoState();
 
}
@override
class _OneNegosyoState extends State<OneNegosyo> {
//bool isLoading=false;
 // Future<List<Supplier>> data;
   List<Widget> imageSliders;
   int _current = 0;
   //DIALOG
BuildContext dialogContext;

List<String> imgList = [
  'https://www.franchisemarket.ph/application/files/cache/thumbnails/b8ad848c390b0ed30973dafbf4ba39ed.jpg',
  'https://dhdnzx78tqry5.cloudfront.net/uploads/deal/thumb/24477.jpg',
  'https://1.bp.blogspot.com/-1fthcvG7_jA/XoRX6v1TZzI/AAAAAAAAiQQ/Q8nKe0x6t_UPduH1zqleDXRq8otGg8NEACLcBGAsYHQ/s1600/Jollibee.0.jpg',
  'https://cdn.winsightmedia.com/platform/files/public/2020-06/background/shutterstock_1181606473_1592329384.jpg?MZY8yYT5e2RM7arx_lljn.LNxSM78_C9',
  'https://www.joc.com/sites/default/files/field_feature_image/KFC_0.png',
  'https://d1sag4ddilekf6.cloudfront.net/compressed/merchants/2-CYMHN7EUSAUZRA/hero/4ce9dca95bc8492397ba6c7035ec374f_1575951439403897658.png'
]; 
 List<String> businessnames = [
  'Macao Imperial Tea',
  'Andoks Chicken',
  'Jollibee',
  'McDonalds',
  'KFC',
  'Chowking',
]; 

List<String> businessCategories = ['Milk Tea/Beverages', 'Chicken Wholesaler', 'Fastfood Service', 'Fastfood Service', 'Fastfood Service', 'Fastfood Service'];
List<String> businessLocation = ['Cainta, Rizal', 'Cainta, Rizal', 'Cainta, Rizal', 'Cainta, Rizal', 'Cainta, Rizal', 'Cainta, Rizal'];
List<String> openHours = ['8AM', '8AM', '8AM', '8AM', '8AM', '8AM'];
List<String> closeHours = ['5PM', '5PM', '5PM', '5PM', '5PM', '5PM'];
List<String> businessDays = ['Monday-Friday', 'Monday-Friday', 'Monday-Friday', 'Monday-Friday', 'Monday-Friday', 'Monday-Friday'];
List<String> contactdetails = ['09266681171', '09266681171', '09266681171', '09266681171', '09266681171', '09266681171'];
List<String> businessDesc = ['Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor'];


String formatDate(DateTime date) => new DateFormat("MMMM dd, yyyy").format(date);
 List<String> newsdates;
 _OneNegosyoState();


@override
  void initState() {
    super.initState();
    
 WidgetsBinding.instance.addPostFrameCallback((_) => showAlertDialog(dialogContext));
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
                        businessnames[imgList.indexOf(item)],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ), Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Align(alignment: FractionalOffset.center , child: Padding( padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0, top:5.0), child: Icon(Icons.location_city_rounded, size:15, color:  Colors.white,))),
                        Text(
                        businessLocation[imgList.indexOf(item)],
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
                  return OneNegosyoDetail(imgList[imgList.indexOf(item)],businessnames[imgList.indexOf(item)], businessCategories[imgList.indexOf(item)], businessLocation[imgList.indexOf(item)], openHours[imgList.indexOf(item)], closeHours[imgList.indexOf(item)], businessDays[imgList.indexOf(item)], businessDesc[imgList.indexOf(item)], contactdetails[imgList.indexOf(item)] );})); 

        },
        );}
        ).toList(); 
      
  }     

     refresh() async {

    setState(() {
        
        });
  }     
  
showAlertDialog(BuildContext dialogContext) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("Got it!"),
    onPressed: () {
      Navigator.of(dialogContext).pop();
     },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Welcome to One Negosyo"),
    content: Text("Here you can request for your Businesses to be advertised in Cainta.\n\nClick 'Advertise my Business' to get send yours for approval."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
       dialogContext = context;
      return alert;
    },
  );
}                                                  
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "One Negosyo"),
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
                            height:100.0,
                            width: 200.0,
                            child: FittedBox( child:FloatingActionButton.extended(
                                                elevation: 40.0,
                                                icon: Icon(Icons.check_circle_rounded,color: Colors.white.withOpacity(0.9),),
                                                label:  Text("Advertise your Business", style: TextStyle(color: Colors.white.withOpacity(0.9))),
                                                backgroundColor: Colors.green[500],
                                                onPressed: ()
                                                {
                                                      return null;

                                                
                                                }     
                                            
                          ))),
 
              body:Scrollbar( child:RefreshIndicator(  onRefresh: () => refresh(),

                child: SingleChildScrollView(
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
                                   "Other Featured Negosyo:",
                                style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, ),
                                
                                 ) 
                                ),
                    ),
                    ]),
            
          Container( 
                 color:  Colors.transparent,
                   child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: businessnames.length,
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
                                              title:  Padding(padding:EdgeInsets.fromLTRB(2,5,5,5), child:Text(businessnames[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue[900]))),
                                              subtitle: Padding(padding:EdgeInsets.all(5), child:Text(businessCategories[index], //PREVIEW NEWS TEXT
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
                                                     Padding(padding:EdgeInsets.only(left:20,right:5), child:Icon(Icons.location_city_rounded, size:15, color:  Colors.black.withOpacity(0.6),)),
                                                    Text( businessLocation[index],style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.bold),),
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
                                                      child:  FlatButton(child: 
                                                      
                                                      Text("See more details"),

                                                onPressed: null) ,
                                                ),
                                            ],
                                            ),
                                            ]) 
                                           ])                
                                          ),
                                         onTap: () {
                                                                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                                                                        return OneNegosyoDetail(imgList[index],businessnames[index], businessCategories[index], businessLocation[index], openHours[index], closeHours[index], businessDays[index], businessDesc[index],contactdetails[index]);}));                                  
                                     },                 
                                      );
                                  })
                   ) 
    ]),    
    ),        
    ),
    ),  
    )                        
    );
  }
}

