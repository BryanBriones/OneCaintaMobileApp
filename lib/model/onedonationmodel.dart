import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:onecaintamobileapp/apilist/endpoints.dart';


class OneDonationDriveModel {
  String donationID;
  String donationChannel;
  String donationChannelName;
  String donationChannelValue;

  OneDonationDriveModel(
      {this.donationID,
      this.donationChannel,
      this.donationChannelName,
      this.donationChannelValue});

  OneDonationDriveModel.fromJson(Map<String, dynamic> json) {
    donationID = json['DonationID'];
    donationChannel = json['DonationChannel'];
    donationChannelName = json['DonationChannelName'];
    donationChannelValue = json['DonationChannelValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DonationID'] = this.donationID;
    data['DonationChannel'] = this.donationChannel;
    data['DonationChannelName'] = this.donationChannelName;
    data['DonationChannelValue'] = this.donationChannelValue;
    return data;
  }
}

class OneDonationOrgModel {
  String beneficiaryID;
  String beneficiaryName;

  OneDonationOrgModel({this.beneficiaryID, this.beneficiaryName});

  OneDonationOrgModel.fromJson(Map<String, dynamic> json) {
    beneficiaryID = json['BeneficiaryID'];
    beneficiaryName = json['BeneficiaryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BeneficiaryID'] = this.beneficiaryID;
    data['BeneficiaryName'] = this.beneficiaryName;
    return data;
  }
}


Future<List<OneDonationDriveModel>> fetchDonationDrive() async {

  
    final response = await http.get(Endpoints.oneDonationDriveEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting donationdrive, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => new OneDonationDriveModel.fromJson(item)).toList();
    } else {
    
    throw Exception('Loading errored in getting donationdrive, please try again.');
   
    }
  }

  Future<List<OneDonationOrgModel>> fetchDonationOrg() async {

  
    final response = await http.get(Endpoints.oneDonationOrgEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting org, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => new OneDonationOrgModel.fromJson(item)).toList();
    } else {
    
    throw Exception('Loading errored in getting org, please try again.');
   
    }
  }

Future<List<String>> getOneDonation() async {
  var value = <String>[];
  var r1 = http.get(Endpoints.oneDonationDriveEndpoint);
  var r2 = http.get(Endpoints.oneDonationOrgEndpoint);
  var results = await Future.wait([r1, r2]); // list of Responses
  for (var response in results) {
       if ( response != null && response.statusCode == 200) {
           value.add(response.body);
       }
       else {
        throw Exception('Loading errored in getting org, please try again.');
    }
  }

  return value;
}


