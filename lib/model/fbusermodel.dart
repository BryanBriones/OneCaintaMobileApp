
import 'package:http/http.dart' as http;
import 'dart:convert';

class FBUserModel {
  String firstName;
  String lastName;
  String email;
  Picture picture;
  String id;

  FBUserModel(
      {this.firstName, this.lastName, this.email, this.picture, this.id});

  FBUserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }
    data['id'] = this.id;
    return data;
  }

    
  static getUserProfileFB(Map<String, dynamic> _userData)  {
     List<Map<String, dynamic>> currentcred = [_userData];
      return  currentcred.map((login) => new FBUserModel.fromJson(login)).toList()[0];
     
  }

  
}

class Picture {
  Data data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int height;
  bool isSilhouette;
  String url;
  int width;

  Data({this.height, this.isSilhouette, this.url, this.width});

  Data.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    isSilhouette = json['is_silhouette'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['is_silhouette'] = this.isSilhouette;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }


}
  



