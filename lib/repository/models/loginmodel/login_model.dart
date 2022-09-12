/// status : "success"
/// code : 200
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTY2NTYyMDBmNGE1YWJhOWE2NTk2NTZjZmEzZmRiNmE4MTlmMTg4OTA5MDNmZjIxODFiOWM4NjQ4YTYxODMzYmFiZWRkYjdkMDVhMDljNzQiLCJpYXQiOjE2NjI5NzUwMTgsIm5iZiI6MTY2Mjk3NTAxOCwiZXhwIjoxNjk0NTExMDE4LCJzdWIiOiIxMCIsInNjb3BlcyI6W119.YOZTgZavnHKeeBnBjLMh32FjxgikTKE09UCNhdPHiR4mC4z_oVqr2LzlrRpZ8yLrq22PIJcgZpIHit2LdAjqXben6ysLnPTuFaCEGSeuYHM1ZxP49VLHcVthBTs8kbJVy0_7WbvTn8m0nPk5mToWUMPaO0iWM6gecDgk1DIzIcH2Uzci06nVCylhteGJMjoKs-PCmL5sSg98Zqe8ncyU5fpZGXEyIHq_zgOxzX1zCBFewy3-T6hdGHpEKJUnw0aJFohtcKP46Kt2Ilw0Nq4k5JdiQoi_kyPkSkiJc_s-7MK_i61xgtEMOJ6XeQAr43gPTLKb9VqnKqhZHqpvWDn_AC8Tp_De1vWtd6TSjY36XK1l1IDAsiG5AGnubzSqLHVEhRTD--poRrbf1SYcgsCQTJy0Ud0umv3o3iiZwDWiy5Y6_6M08Fe2TSXT-4gkzGAxg2r78cSUB07qc4eVOU0e09V0qcOojBQw5Z6IdSCktMQ9fidZUbk3AV26pWNkoR0AS8Xa2qSf4Y8yetCc2l_e_BQjcaJP8KqzO929ti8Ewj76Tq8ElWciGbAULyh951AwWjImyUwgBdvdoqWlhiJ_XXYnm3bIQKkTgp3VODCyBXRp91QEwTl_SDId6WNZFFtHk7LEP7Q5pg5pBdXsqad4euHEgwi1anH0pj_2V1wT0gs","id":10,"uuid":"efe3b84e-8a8e-4fee-b9af-f6833718c776","code":"VVP001","username":"SURESH.R","phone":"9840195428","student_id":1,"photo":"https://test.schoolec.in/storage/images/parent/2020-2021/qMtcd8McovHeL2fyPEh3bvQ33xhLobQ6dOTC0NI6.jpeg","token_type":"Bearer","error":false,"message":"Login Successfully!!!","expires_at":"2023-09-12 15:00:18"}

class LoginModel {
  LoginModel({
      String? status, 
      num? code, 
      Data? data,}){
    _status = status;
    _code = code;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  num? _code;
  Data? _data;
LoginModel copyWith({  String? status,
  num? code,
  Data? data,
}) => LoginModel(  status: status ?? _status,
  code: code ?? _code,
  data: data ?? _data,
);
  String? get status => _status;
  num? get code => _code;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTY2NTYyMDBmNGE1YWJhOWE2NTk2NTZjZmEzZmRiNmE4MTlmMTg4OTA5MDNmZjIxODFiOWM4NjQ4YTYxODMzYmFiZWRkYjdkMDVhMDljNzQiLCJpYXQiOjE2NjI5NzUwMTgsIm5iZiI6MTY2Mjk3NTAxOCwiZXhwIjoxNjk0NTExMDE4LCJzdWIiOiIxMCIsInNjb3BlcyI6W119.YOZTgZavnHKeeBnBjLMh32FjxgikTKE09UCNhdPHiR4mC4z_oVqr2LzlrRpZ8yLrq22PIJcgZpIHit2LdAjqXben6ysLnPTuFaCEGSeuYHM1ZxP49VLHcVthBTs8kbJVy0_7WbvTn8m0nPk5mToWUMPaO0iWM6gecDgk1DIzIcH2Uzci06nVCylhteGJMjoKs-PCmL5sSg98Zqe8ncyU5fpZGXEyIHq_zgOxzX1zCBFewy3-T6hdGHpEKJUnw0aJFohtcKP46Kt2Ilw0Nq4k5JdiQoi_kyPkSkiJc_s-7MK_i61xgtEMOJ6XeQAr43gPTLKb9VqnKqhZHqpvWDn_AC8Tp_De1vWtd6TSjY36XK1l1IDAsiG5AGnubzSqLHVEhRTD--poRrbf1SYcgsCQTJy0Ud0umv3o3iiZwDWiy5Y6_6M08Fe2TSXT-4gkzGAxg2r78cSUB07qc4eVOU0e09V0qcOojBQw5Z6IdSCktMQ9fidZUbk3AV26pWNkoR0AS8Xa2qSf4Y8yetCc2l_e_BQjcaJP8KqzO929ti8Ewj76Tq8ElWciGbAULyh951AwWjImyUwgBdvdoqWlhiJ_XXYnm3bIQKkTgp3VODCyBXRp91QEwTl_SDId6WNZFFtHk7LEP7Q5pg5pBdXsqad4euHEgwi1anH0pj_2V1wT0gs"
/// id : 10
/// uuid : "efe3b84e-8a8e-4fee-b9af-f6833718c776"
/// code : "VVP001"
/// username : "SURESH.R"
/// phone : "9840195428"
/// student_id : 1
/// photo : "https://test.schoolec.in/storage/images/parent/2020-2021/qMtcd8McovHeL2fyPEh3bvQ33xhLobQ6dOTC0NI6.jpeg"
/// token_type : "Bearer"
/// error : false
/// message : "Login Successfully!!!"
/// expires_at : "2023-09-12 15:00:18"

class Data {
  Data({
      String? token, 
      num? id, 
      String? uuid, 
      String? code, 
      String? username, 
      String? phone, 
      num? studentId, 
      String? photo, 
      String? tokenType, 
      bool? error, 
      String? message, 
      String? expiresAt,}){
    _token = token;
    _id = id;
    _uuid = uuid;
    _code = code;
    _username = username;
    _phone = phone;
    _studentId = studentId;
    _photo = photo;
    _tokenType = tokenType;
    _error = error;
    _message = message;
    _expiresAt = expiresAt;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _id = json['id'];
    _uuid = json['uuid'];
    _code = json['code'];
    _username = json['username'];
    _phone = json['phone'];
    _studentId = json['student_id'];
    _photo = json['photo'];
    _tokenType = json['token_type'];
    _error = json['error'];
    _message = json['message'];
    _expiresAt = json['expires_at'];
  }
  String? _token;
  num? _id;
  String? _uuid;
  String? _code;
  String? _username;
  String? _phone;
  num? _studentId;
  String? _photo;
  String? _tokenType;
  bool? _error;
  String? _message;
  String? _expiresAt;
Data copyWith({  String? token,
  num? id,
  String? uuid,
  String? code,
  String? username,
  String? phone,
  num? studentId,
  String? photo,
  String? tokenType,
  bool? error,
  String? message,
  String? expiresAt,
}) => Data(  token: token ?? _token,
  id: id ?? _id,
  uuid: uuid ?? _uuid,
  code: code ?? _code,
  username: username ?? _username,
  phone: phone ?? _phone,
  studentId: studentId ?? _studentId,
  photo: photo ?? _photo,
  tokenType: tokenType ?? _tokenType,
  error: error ?? _error,
  message: message ?? _message,
  expiresAt: expiresAt ?? _expiresAt,
);
  String? get token => _token;
  num? get id => _id;
  String? get uuid => _uuid;
  String? get code => _code;
  String? get username => _username;
  String? get phone => _phone;
  num? get studentId => _studentId;
  String? get photo => _photo;
  String? get tokenType => _tokenType;
  bool? get error => _error;
  String? get message => _message;
  String? get expiresAt => _expiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['code'] = _code;
    map['username'] = _username;
    map['phone'] = _phone;
    map['student_id'] = _studentId;
    map['photo'] = _photo;
    map['token_type'] = _tokenType;
    map['error'] = _error;
    map['message'] = _message;
    map['expires_at'] = _expiresAt;
    return map;
  }

}