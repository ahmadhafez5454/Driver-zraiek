class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}





class LoginResponseModel {
  String? data;
  String? msg;
  int? status;

  LoginResponseModel({this.data, this.msg, this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}
