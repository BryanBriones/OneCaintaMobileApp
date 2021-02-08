
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class JobsContentWidget extends StatefulWidget {
   final String jobdesctext;
JobsContentWidget(this.jobdesctext);
  
 @override
  _JobsContentWidgetState createState() => _JobsContentWidgetState(this.jobdesctext);
}

class _JobsContentWidgetState extends State<JobsContentWidget>{

     final String jobdesctext;
_JobsContentWidgetState(this.jobdesctext);

 final _key = new GlobalKey<FormState>();
showloadingscreen(BuildContext context)
   {
     
                 
    AlertDialog alert=AlertDialog(
           backgroundColor: Colors.yellow[700],
      content: new Row(
        children: [
          CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
          Container(margin: EdgeInsets.only(left: 30),child:Text("Loading..." , style: TextStyle(color:Colors.white),)),
        ],),
    );
    showDialog(barrierDismissible: false,

      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  

   }
@override
  Widget build(BuildContext context) { 
        return  Row(
          
          children: 
          [ 
            Expanded(child:Material( 
                       child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start ,
                          children:[  
                                      //                             Html( 
                                      //                               data: """<div class="FYwKg fB92N_6" style='margin: 0px; padding: 24px 0px 0px; border: 0px; box-sizing: border-box; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: "Times New Roman"; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: none; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>
                                      //     <div class="FYwKg fB92N_6" style='margin: 0px; padding: 0px 0px 0px; border: 0px; box-sizing: border-box; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: "Times New Roman"; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: none; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>
                                      //         <h3 class="FYwKg C6ZIU_6 _3nVJR_6 _2VCbC_6 _27Shq_6 _1VMf3_6" style='margin: 0px; padding: 0.05px 0px; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 500; font-stretch: inherit; font-size: 18px; line-height: 28px; font-family: Roboto, "Helvetica Neue", HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(28, 28, 28);'>Job Description</h3>
                                      //     </div>
                                      //     <div class="FYwKg fB92N_6" style='margin: 0px; padding: 24px 0px 0px; border: 0px; box-sizing: border-box; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: medium; line-height: inherit; font-family: "Times New Roman"; vertical-align: baseline; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: none; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>
                                      //         <div class="vDEj0_6" data-automation="jobDescription" style="font-family: inherit; font-weight: 400;"><span class="FYwKg _1GAuD C6ZIU_6 _6ufcS_6 _27Shq_6 _29m7__6" style='margin: 0px; padding: 0px; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 400; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Roboto, "Helvetica Neue", HelveticaNeue, Helvetica, Arial, sans-serif; vertical-align: baseline; -webkit-tap-highlight-color: transparent; display: block; color: rgb(28, 28, 28);'>
                                      //                 <div class="FYwKg" style="margin: 0px; padding: 0px; border: 0px; box-sizing: border-box; font: inherit; vertical-align: baseline; -webkit-tap-highlight-color: transparent;">
                                      //                     <ul style="padding-bottom: 12px;">
                                      //                         <li style="display: list-item; padding-bottom: 4px; margin-left: 20px; list-style: disc;">Candidate must possess at least Bachelor&apos;s/College Degree in Computer Science/Information Technology, Business Studies/Administration/Management, Finance/Accountancy/Banking, Others or equivalent.</li>
                                      //                         <li style="display: list-item; padding-bottom: 4px; margin-left: 20px; list-style: disc;">No work experience required.</li>
                                      //                         <li style="display: list-item; padding-bottom: 4px; margin-left: 20px; list-style: disc;">Preferably Less than 1 year experience specialized in Clerical/Administrative Support or equivalent.</li>
                                      //                         <li style="display: list-item; padding-bottom: 4px; margin-left: 20px; list-style: disc;">Computer Literate</li>
                                      //                     </ul>
                                      //                 </div>
                                      //             </span></div>
                                      //     </div>
                                      // </div>"""          
                                      //                               )

                                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10), child:Text(jobdesctext.replaceAll(r'\n', '\n'))) 
                                   
                       ],),
              )),
          ]);

  }
}



