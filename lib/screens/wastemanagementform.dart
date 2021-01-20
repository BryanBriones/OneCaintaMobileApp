import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:onecaintamobileapp/components/home/appbarplain.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';


//Models
import 'package:onecaintamobileapp/model/wastemanagementmodel.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';



class WasteManagementForm extends StatefulWidget {


   @override
 State<StatefulWidget> createState() => _WasteManagementFormState();
    
  

}

class _WasteManagementFormState extends State<WasteManagementForm>{



  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

_WasteManagementFormState();


//--PHONE NUMBER
  String initialCountry = 'PH';
  PhoneNumber number = PhoneNumber(isoCode: 'PH');
  
  WasteManagementModel wasteModdel;
  TextEditingController textEditingController = TextEditingController();
   TextEditingController dateController = TextEditingController();
  bool hasError = false;

String dateSelected;
  String fullname;
  String email;
  String phonenumber;


//DROPDOWN DIALOG SELECT
  String location;
  List<S2Choice<String>> options = [
  S2Choice<String>(value: 'ion', title: 'Santa Rosa'),
  S2Choice<String>(value: 'flu', title: 'San Andres'),
  S2Choice<String>(value: 'rea', title: 'San Roque'),
];



//ADAPTIVE SCREEN
  double heightwithKeyboard = 1;
  bool showScrollbar = false;
  final _scrollController = ScrollController();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dateSelected = DateFormat('MM/dd/yyyy').format(DateTime.now());
  
  // S2Choice<String> shit = new S2Choice<String>(value: 'pekpek', title:'pekpek');
  //   options.add(shit);

   //location =options[0].value;


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
   void _selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // Refer step 1
    firstDate: DateTime(DateTime.now().year),
    lastDate: DateTime(DateTime.now().year + 1),
  );
  if (picked != null )
    setState(() {
      dateSelected = DateFormat('MM/dd/yyyy').format(picked);
      dateController.text = dateSelected; 
    });
}

  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarPlainWidget(60,"none", "Ask for Garbage Collection"),
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
                  'To proceed, enter your info below',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: formKey,
                child: Column( children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 5),
                    child:    SmartSelect<String>.single(
                                            title: 'Your Barangay',
                                            value: location,
                                            choiceItems: options,
                                              modalType: S2ModalType.bottomSheet,
                                            
                                            onChange: (state) => setState(() => location = state.value)
                                          ),
                   ),
                
                   Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 30),
                    child: TextFormField(
                         controller: dateController,
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
                           onTap: () => _selectDate(context),
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
                        vertical: 5.0, horizontal: 30),
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
                        vertical: 5.0, horizontal: 30),
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
                        vertical: 5.0, horizontal: 30),
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
                        if(formKey.currentState.validate() && location != null)
                        {

                              formKey.currentState.save();
                           
                              //FRONTEND CHECK
                              //BACKEND CHECK
                              //databasesaving
                            
                              wasteModdel= new WasteManagementModel(fullname: fullname, email:  email, phonenumber: phonenumber, dateSelected: dateSelected, location: location);

                                 showToast("Registration complete.");
                        }
                        
                        else{
                          showToast("Please correct form before proceeding.");
                           if(location == null)
                             showToast("Select your location.");

                        }
                        
                      },
                    child: Center(
                        child: Text(
                      "REQUEST TRASH COLLECTION".toUpperCase(),
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
