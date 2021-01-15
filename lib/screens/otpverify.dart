import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';


//Screens
import 'package:onecaintamobileapp/screens/login.dart';
import 'package:onecaintamobileapp/screens/otpform.dart';

//Components
import 'package:onecaintamobileapp/utility/flutttertoast.dart';
import 'package:onecaintamobileapp/components/home/appbarbackbtn.dart';




class OTPVerify extends StatefulWidget {
  final String userphonenumber;
  OTPVerify(this.userphonenumber);
  @override
 State<StatefulWidget> createState() {
     return _OTPVerifyState(this.userphonenumber);
  }
}

class _OTPVerifyState extends State<OTPVerify>{
  final String userphonenumber;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

_OTPVerifyState(this.userphonenumber);


//PHONE VARIABLES

String _verificationId;
FirebaseAuth auth = FirebaseAuth.instance;
var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();


  bool hasError = false;
  String otpCode = "";

@override
void initState()
{
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
  super.initState();
   _otpLogin();
}

Future<void> _otpLogin() async {

        try {

         

      
           await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: userphonenumber,
                timeout: const Duration(seconds: 60),
                codeSent: (String verificationId, int resendToken) async {
                  // Create a PhoneAuthCredential with the code
                 _verificationId = verificationId;
                  //PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                      showToast("OTP Code Sent.");
                  // Sign the user in (or link) with the credential
                 // await auth.signInWithCredential(phoneAuthCredential);

                },
                verificationCompleted: (PhoneAuthCredential credential) async {

                  await auth.signInWithCredential(credential);
                     showToast("OTP Verified. Proceed on next page.");
                  
                },
                verificationFailed: (FirebaseAuthException e) {
                      
                   print(e);

                  if (e.code == 'invalid-phone-number') {
                        showToast('The provided phone number is not valid.');
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                        {return Login();}),(Route<dynamic> route) => false);
                      }
                  else {

                       showToast('OTP Verification Failed. Please try again');
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                        {return Login();}),(Route<dynamic> route) => false);
                  }
                   
                },
                codeAutoRetrievalTimeout: (String verificationId) {
                  //  showToast("OTP Verification Timeout. Please retry");
                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                    //                     {return Login();}),(Route<dynamic> route) => false);

                },
              );
        } catch (err)  {
          print(err);
          setState(() {

             showToast("Login failed, please try again.");
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                      {return Login();}),(Route<dynamic> route) => false);
          });
         
        }
    }

 
  @override
  Widget build(BuildContext context) {
 
    return Scaffold( appBar:  AppBarBackButtonWidget(60,"none", "Verify your OTP"),
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
                  'Mobile Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: userphonenumber,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.none,

                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 40,

                      ),
                      cursorColor: Colors.black,
                      textStyle: TextStyle(fontSize: 20, height: 1.6),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: false,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          otpCode = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                    children: [
                      TextSpan(
                          text: " RESEND",
                          recognizer: onTapRecognizer,
                          style: TextStyle(
                              color: Color(0xFF91D3B3),
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ]),
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
                    onPressed: () async {
                      formKey.currentState.validate();
                      // conditions for validating
                      if (otpCode.length != 6) {
                       
                        setState(() {
                          hasError = true;
                        });
                      } else {

                            try{
                              
                              PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otpCode);
                              await auth.signInWithCredential(phoneAuthCredential);
                        


                              } on FirebaseAuthException catch(e){

                                          print(e);
                                
                                              if (e.code == 'session-expired') {
                                                    showToast('These code expired. Click resend for a new one.');

                                                  }
                                              else {

                                                  showToast('OTP Verification Failed. Please try again');
                                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                                                    {return Login();}),(Route<dynamic> route) => false);
                                              }
                              }
                        
                            setState(()  {
                              hasError = false;
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("Your mobile phone is verified."),
                                duration: Duration(seconds: 2),
                              ));

                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) 
                                                                    {return OTPForm(userphonenumber);}),(Route<dynamic> route) => false);

                            });
                      }
                    },
                    child: Center(
                        child: Text(
                      "VERIFY".toUpperCase(),
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
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text("Clear"),
                    onPressed: () {
                      textEditingController.clear();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
                                     ),
                                 ),
                    );
                 }
}
