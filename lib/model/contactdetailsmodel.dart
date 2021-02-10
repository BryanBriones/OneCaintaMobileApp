import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:onecaintamobileapp/apilist/endpoints.dart';

class ContactDetailsModel {
  String contactID;
  String contactType;
  String contactAgency;
  String contactAgencyName;
  String contactValue;

  ContactDetailsModel(
      {this.contactID,
      this.contactType,
      this.contactAgency,
      this.contactAgencyName,
      this.contactValue});

  ContactDetailsModel.fromJson(Map<String, dynamic> json) {
    contactID = json['ContactID'];
    contactType = json['ContactType'];
    contactAgency = json['ContactAgency'];
    contactAgencyName = json['ContactAgencyName'];
    contactValue = json['ContactValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ContactID'] = this.contactID;
    data['ContactType'] = this.contactType;
    data['ContactAgency'] = this.contactAgency;
    data['ContactAgencyName'] = this.contactAgencyName;
    data['ContactValue'] = this.contactValue;
    return data;
  }
}


Future<List<ContactDetailsModel>> fetchContacts() async {

  
    final response = await http.get(Endpoints.contactsEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting contacts, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => new ContactDetailsModel.fromJson(news)).toList();
    } else {
    
    throw Exception('Loading errored in getting contacts, please try again.');
   
    }
  }