

//Flutter Material 
import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

//Components


//Screens
import 'package:onecaintamobileapp/screens/home.dart';




//import 'package:flutter_brand_icons/flutter_brand_icons.dart';

class Login extends StatefulWidget{
 @override
_LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>{
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'PH';
  PhoneNumber number = PhoneNumber(isoCode: 'PH');
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
          resizeToAvoidBottomInset: false,   
          floatingActionButton:  FloatingActionButton.extended(
                            elevation: 40.0,

                            icon: Icon(Icons.chevron_right,color: Colors.white.withOpacity(0.9),),
                             label:  Text("Bagong Balita sa Cainta", style: TextStyle(color: Colors.white.withOpacity(0.9))),
                            backgroundColor: Colors.blue[500],
                            onPressed: ()
                            {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                                 return Home(0);}));
                            }     
                        
                          ),
                body:Container( height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                child:  
                                       Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children:[
                                                              Expanded(
                                                                  flex: 4,
                                                                   child:
                                                                   Column(
                                                                       children: <Widget>[
                                                                      Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * .10)),
                                                                          Container(width: 80, height:80, 
                                                                                  decoration: new BoxDecoration(
                                                                                    image: new DecorationImage(
                                                                                     
                                                                                      image: new AssetImage("assets/caintalogo.png"),
                                                                                      fit: BoxFit.cover,
                                                                                    ),)),       
                                                                        Center(child:Text("One Cainta", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue[900]),)),
                                                                        Center(child:Text("Serbisyong para sa publiko", style: TextStyle(fontSize: 15,color: Colors.blue[900], fontWeight: FontWeight.bold),)),
                                                                        Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * .05,30,MediaQuery.of(context).size.height * .05,30), child: InternationalPhoneNumberInput(
                                                                                      onInputChanged: (PhoneNumber number) {
                                                                                        print(number.phoneNumber);
                                                                                      },
                                                                                      onInputValidated: (bool value) {
                                                                                        print(value);
                                                                                      },
                                                                                      selectorConfig: SelectorConfig(
                                                                                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                                                                      ),
                                                                                       ignoreBlank: false,
                                                                                      autoValidateMode: AutovalidateMode.disabled,
                                                                                      selectorTextStyle: TextStyle(color: Colors.black),
                                                                                      initialValue: number,
                                                                                       textFieldController: controller,
                                                                                       formatInput: false,
                                                                                       maxLength: 10,
                                                                                       keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                                                                      inputBorder: OutlineInputBorder(),
                                                                                      onSaved: (PhoneNumber number) {
                                                                                        print('On Saved: $number');
                                                                                      },
                                                                                    ),),
                                                                           SizedBox(width: 200, height:40,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(Icons.phone, color: Colors.white),    //Icon(Icons.person_pin, size:30, color: Colors.white),
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Send OTP", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                            
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                                                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                              //    return Register('Supplier');}));
                                                                                         
                                                                                        },)),

                                                                      Row(
                                                                      children: <Widget>[
                                                                          Expanded(
                                                                            child: Divider( color: Colors.grey, thickness: 0.5,)
                                                                          ),       
                                                                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20) , child: Text("OR", style: TextStyle(color: Colors.blue[500]),)),        
                                                                          Expanded(
                                                                              child: Divider( color: Colors.grey, thickness: 0.5,)
                                                                          ),
                                                                      ]
                                                                  ),     
                                                                        ]),
                                                                       ),
                                                            Expanded(
                                                                   flex: 2,
                                                                   child:
                                                                   Column(
                                                                          
                                                                     children: <Widget>[

                                                                        SizedBox(width: 200, height:40,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(BrandIcons.facebook, color: Colors.white),    
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Log in by FB", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                            
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                                                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                              //    return Register('Supplier');}));
                                                                                         
                                                                                        },)),
                                                                         Padding(padding: EdgeInsets.only(top:5)),
                                                                         SizedBox(width: 200, height:40,  child:FlatButton(color: Colors.blue[500], 
                                                                                  child: Row( mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                                                                              Icon(BrandIcons.google, color: Colors.green[200]),   
                                                                                            Padding(padding: EdgeInsets.only(left:10)),
                                                                                            Text("Log in by Google", style: TextStyle(fontSize: 17, color: Colors.white,))
                                                                                            
                                                                                          ],
                                                                                        ), onPressed: (){ 
                                                                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                                                                                              //    return Register('Supplier');}));
                                                                                         
                                                                                        },)),
  
                                                                    Center( child:(
                                                                      FlatButton(child: Text("Wala pang account?, Mag sign-up dito", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue[900])),
                                                                              onPressed: (){
                                                                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return SignIn();}));

                                                                              },
                                                                                )
                                                                                ),
                                                                               ) 
                                                                   ],)
                                                                   
                                                                               ),
                                                                              ],
),
),
);
                                          

  }



}
