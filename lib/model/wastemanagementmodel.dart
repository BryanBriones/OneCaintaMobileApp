  
  class WasteManagementModel {
  String dateSelected;
  String fullname;
  String email;
  String phonenumber;
    String location;

  WasteManagementModel({this.dateSelected,this.phonenumber, this.fullname, this.email, this.location});

  WasteManagementModel.fromJson(Map<String, dynamic> json) {
    phonenumber = json['phonenumber'];
    fullname = json['fullname'];
    email = json['email'];
    dateSelected = json['dateSelected'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phonenumber'] = this.phonenumber;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['dateSelected'] = this.dateSelected;
    data['location'] = this.location;
    return data;
  }
  }