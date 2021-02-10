import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:onecaintamobileapp/apilist/endpoints.dart';

class PolicyModel {
  String policyID;
  String question;
  String answerBody;

  PolicyModel({this.policyID, this.question, this.answerBody});

  PolicyModel.fromJson(Map<String, dynamic> json) {
    policyID = json['PolicyID'];
    question = json['Question'];
    answerBody = json['AnswerBody'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PolicyID'] = this.policyID;
    data['Question'] = this.question;
    data['AnswerBody'] = this.answerBody;
    return data;
  }
}

Future<List<PolicyModel>> fetchPolicies() async {

  
    final response = await http.get(Endpoints.policiesEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting Org, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => new PolicyModel.fromJson(news)).toList();
    } else {
    
    throw Exception('Loading errored in getting Org, please try again.');
   
    }
  }
