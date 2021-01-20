  
  class OnlineReservationModel {
  String dateSelected;
  String fullname;
  String email;
  String phonenumber;

  OnlineReservationModel({this.dateSelected,this.phonenumber, this.fullname, this.email});

  OnlineReservationModel.fromJson(Map<String, dynamic> json) {
    phonenumber = json['phonenumber'];
    fullname = json['fullname'];
    email = json['email'];
    dateSelected = json['dateSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phonenumber'] = this.phonenumber;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['dateSelected'] = this.dateSelected;
    return data;
  }
  }