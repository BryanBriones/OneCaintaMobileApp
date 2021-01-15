class OTPUserModel {
  String phonenumber;
  String fullname;
  String email;

  OTPUserModel({this.phonenumber, this.fullname, this.email});

  OTPUserModel.fromJson(Map<String, dynamic> json) {
    phonenumber = json['phonenumber'];
    fullname = json['fullname'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phonenumber'] = this.phonenumber;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    return data;
  }

}