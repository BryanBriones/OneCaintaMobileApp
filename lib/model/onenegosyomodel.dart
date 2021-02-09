import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:onecaintamobileapp/apilist/endpoints.dart';

class OneNegosyoModel {
  String businessID;
  String businessName;
  String openHours;
  String closeHours;
  String businessDayOpen;
  String businessDayClose;
  String contactDetails;
  String businessDesc;
  String businessLocation;
  String businessCategory;
  String businessImg;

  OneNegosyoModel(
      {this.businessID,
      this.businessName,
      this.openHours,
      this.closeHours,
      this.businessDayOpen,
      this.businessDayClose,
      this.contactDetails,
      this.businessDesc,
      this.businessLocation,
      this.businessCategory,
      this.businessImg});

  OneNegosyoModel.fromJson(Map<String, dynamic> json) {
    businessID = json['BusinessID'];
    businessName = json['BusinessName'];
    openHours = json['OpenHours'];
    closeHours = json['CloseHours'];
    businessDayOpen = json['BusinessDayOpen'];
    businessDayClose = json['BusinessDayClose'];
    contactDetails = json['ContactDetails'];
    businessDesc = json['BusinessDesc'];
    businessLocation = json['BusinessLocation'];
    businessCategory = json['BusinessCategory'];
    businessImg = json['BusinessImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BusinessID'] = this.businessID;
    data['BusinessName'] = this.businessName;
    data['OpenHours'] = this.openHours;
    data['CloseHours'] = this.closeHours;
    data['BusinessDayOpen'] = this.businessDayOpen;
    data['BusinessDayClose'] = this.businessDayClose;
    data['ContactDetails'] = this.contactDetails;
    data['BusinessDesc'] = this.businessDesc;
    data['BusinessLocation'] = this.businessLocation;
    data['BusinessCategory'] = this.businessCategory;
    data['BusinessImg'] = this.businessImg;
    return data;
  }
}


Future<List<OneNegosyoModel>> fetchBusinesses() async {

  
    final response = await http.get(Endpoints.oneNegosyoEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting jobs, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => new OneNegosyoModel.fromJson(item)).toList();
    } else {
    
    throw Exception('Loading errored in getting jobs, please try again.');
   
    }
  }
