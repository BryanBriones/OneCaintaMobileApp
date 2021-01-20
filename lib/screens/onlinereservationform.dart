import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:onecaintamobileapp/components/home/appbarplain.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';


//Models
import 'package:onecaintamobileapp/model/onlinereservationmodel.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';

//Screens
import 'package:onecaintamobileapp/screens/home.dart';


class OnlineReservationForm extends StatefulWidget {
  final String facility;
final String dateSelected;

  OnlineReservationForm(this.dateSelected, this.facility);
   @override
 State<StatefulWidget> createState() {
     return _OnlineReservationFormState(this.dateSelected, this.facility);
  }

}

class _OnlineReservationFormState extends State<OnlineReservationForm>{


String facility;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

_OnlineReservationFormState(this.dateSelected, this.facility);

//FROM MODEL
List<String> timeframes = [ "7AM","8AM", "9AM", "10AM", "11AM", "12PM", "1PM","2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM", "11PM", "12AM", "1AM","2AM", "3AM", "4AM", "5AM", "6AM"];


  List<DropdownMenuItem> timeframesDDItems;
    String timeFrameInitialFrom, timeFrameInitialTo;

//--PHONE NUMBER
  String initialCountry = 'PH';
  PhoneNumber number = PhoneNumber(isoCode: 'PH');
  
   OnlineReservationModel onlineReservationModel;
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  String dateSelected;
  String timeToSelected, timefromSelected;
  String datewithTimeRangeSelected;


  String fullname;
  String email;
  String phonenumber;

//ADAPTIVE SCREEN
  double heightwithKeyboard = 1;
  bool showScrollbar = false;
  final _scrollController = ScrollController();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timefromSelected = timeframes[1];
    timeToSelected = timeframes[2];
    timeframesDDItems =  timeframes.map( (item) => DropdownMenuItem(child: Text(item), value: item)).toList();

     var keyboardVisibilityController = KeyboardVisibilityController();
      keyboardVisibilityController.onChange.listen((bool visible) {
    
        if(visible){
          setState(() {
            heightwithKeyboard = 0.55;
            showScrollbar = true;
            });

        }
        else
        {

              setState(() {
             heightwithKeyboard = 1;
              showScrollbar = false;
            });


        }
  });


  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarPlainWidget(60,"none", "Reservation Details"),
               backgroundColor: Colors.grey[200],
                resizeToAvoidBottomInset: false,
               key: scaffoldKey,
              body:
              Scrollbar(
                isAlwaysShown: showScrollbar,
                controller: _scrollController,
                    child:SingleChildScrollView(
                      controller: _scrollController,
                    child:Container(
           height: MediaQuery.of(context).size.height * heightwithKeyboard,
           width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[ 
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.03)),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                   image: new AssetImage("assets/caintalogo.png"),
                  fit: BoxFit.fitHeight))
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Enter your Reservation Info Below',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: formKey,
                child: Column( children: [
                   Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: TextFormField(
                          initialValue: facility,
                          enabled: false,
                          maxLength: 20,
                             decoration: InputDecoration(
                          counter: Offstage(),
                           hintText: "Facility"
                        ),
                         obscureText: false,
                         validator: (e){
                           if(e.isEmpty)
                                   return "Please insert facility";
                           },
                          onSaved: (e) => dateSelected = e,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),                    
                        )
                   ),
                   Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: TextFormField(
                          initialValue: dateSelected,
                          enabled: false,
                          maxLength: 20,
                             decoration: InputDecoration(
                          counter: Offstage(),
                           hintText: "Date"
                        ),
                         obscureText: false,
                         validator: (e){
                           if(e.isEmpty)
                                   return "Please insert date";
                           },
                          onSaved: (e) => dateSelected = e,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),                    
                        )
                   ),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                     Text("From:"),
                          DropdownButton(
                                items: timeframesDDItems,
                                value: timefromSelected,
                                onChanged: (newVal) {
                                  setState(() {
                                        timefromSelected = newVal;
                                  });
                                },
                              ),
                      Text("To:"),
                        DropdownButton(
                                items: timeframesDDItems,
                                value: timeToSelected,
                                onChanged: (newVal) {
                                  setState(() {
                                      timeToSelected = newVal;
                                  
                                  });
                                },
                              ),
                   ],) ,   //FROM DROPDOWN
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child:  TextFormField(
                          maxLength: 100,
                             decoration: InputDecoration(
                          counter: Offstage(),
                           hintText: "Full Name"
                        ),
                         obscureText: false,
                         validator: (e){
                           if(e.isEmpty)
                                   return "Please insert Full Name";
                           },
                          onSaved: (e) => fullname = e,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: TextFormField(
                          maxLength: 100,
                          decoration: InputDecoration(
                          counter: Offstage(),
                            hintText: "Email Address"
                        ),
                        
                         obscureText: false,
                         validator: (e) {
                           if (e.isEmpty) {
                              return "Please insert Email";
                            }
                             else if (!EmailValidator.validate(e)) {
                              return "Not a valid email";
                            }
                         },
                         onSaved: (e) => email = e,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ),
              Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                            phonenumber = number.phoneNumber;
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          errorMessage: "Not a valid number",
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET
                          ),
                            ignoreBlank: false,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                            textFieldController: textEditingController,
                            formatInput: false,
                            maxLength: 10,
                            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          
                        ) 
                  ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    onPressed: ()  {
                        if(formKey.currentState.validate())
                        {

                              formKey.currentState.save();
                           
                              //FRONTEND CHECK
                              //BACKEND CHECK
                              //databasesaving
                              datewithTimeRangeSelected =  dateSelected + ' ' + timefromSelected + '-' + timeToSelected;
                              onlineReservationModel = new OnlineReservationModel(fullname: fullname, email:  email, phonenumber: phonenumber, dateSelected: datewithTimeRangeSelected);

                                 showToast("Registration complete.");
                        }
                        else{
                          showToast("Please correct form before proceeding.");

                        }
                        
                      },
                    child: Center(
                        child: Text(
                      "RESERVE THIS TIME".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(-1, 2),
                          blurRadius: 5)
                    ]),
              ),
                ])
               ),
            ]
          ),
        ),
      ),
    ),
    );
}
}
