import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:onecaintamobileapp/apilist/endpoints.dart';

class OneOrgModel {
  String orgID;
  String municipalGovOffice;
  String municipalGovNames;
  String municipalGovDesc;
  String municipalImg;

  OneOrgModel(
      {this.orgID,
      this.municipalGovOffice,
      this.municipalGovNames,
      this.municipalGovDesc,
      this.municipalImg});

  OneOrgModel.fromJson(Map<String, dynamic> json) {
    orgID = json['OrgID'];
    municipalGovOffice = json['MunicipalGovOffice'];
    municipalGovNames = json['MunicipalGovNames'];
    municipalGovDesc = json['MunicipalGovDesc'];
    municipalImg = json['MunicipalImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrgID'] = this.orgID;
    data['MunicipalGovOffice'] = this.municipalGovOffice;
    data['MunicipalGovNames'] = this.municipalGovNames;
    data['MunicipalGovDesc'] = this.municipalGovDesc;
    data['MunicipalImg'] = this.municipalImg;
    return data;
  }
}

Future<List<OneOrgModel>> fetchOrg() async {

  
    final response = await http.get(Endpoints.oneOrgEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting Org, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => new OneOrgModel.fromJson(news)).toList();
    } else {
    
    throw Exception('Loading errored in getting Org, please try again.');
   
    }
  }
