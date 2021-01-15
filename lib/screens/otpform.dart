import 'package:flutter/material.dart';
import 'package:onecaintamobileapp/components/home/appbarplain.dart';
import 'package:email_validator/email_validator.dart';


//Models
import 'package:onecaintamobileapp/model/otpusermodel.dart';
import 'package:onecaintamobileapp/utility/flutttertoast.dart';

//Screens
import 'package:onecaintamobileapp/screens/home.dart';


class OTPForm extends StatefulWidget {
final String phonenumber;

  OTPForm(this.phonenumber);
   @override
 State<StatefulWidget> createState() {
     return _OTPFormState(this.phonenumber);
  }

}

class _OTPFormState extends State<OTPForm>{

 final String phonenumber;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

_OTPFormState(this.phonenumber);

   OTPUserModel otplogindetails;
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  String fullname;
  String email;


  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarPlainWidget(60,"none", "Register Your Sign-in Details"),
               backgroundColor: Colors.grey[200],
               key: scaffoldKey,
              body:Scrollbar(child:SingleChildScrollView(
                        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[ 
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * .10)),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                   image: new AssetImage("assets/caintalogo.png"),
                  fit: BoxFit.fitHeight))
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Enter your Personal Info Below',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Column( children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: TextFormField(
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
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ),
                  SizedBox(
                    height: 20,
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
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ),
                  SizedBox(
                height: 14,
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
                              showToast("Registration complete.");
                              //databasesaving
                              otplogindetails = new OTPUserModel(fullname: fullname, email:  email, phonenumber: phonenumber);

        
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                    {return Home(1, null, null, otplogindetails);}),(Route<dynamic> route) => false);

                        }
                        else{
                          showToast("Please correct form before proceeding.");

                        }
                        
                      },
                    child: Center(
                        child: Text(
                      "PROCEED".toUpperCase(),
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
            ],
          ),
        ),
      ),
    ),
    );
}
}
