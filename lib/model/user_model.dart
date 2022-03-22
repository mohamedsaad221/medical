/// SCHOOL_ID : 1
/// SETTING_KPI_ID : 1
/// CHECKED : "yes"
/// NOTES : "sunt in pariatur amet nostrud"

const String tableUser = 'tableUser';

class LocalUserModelFields {
  static final List<String> values = [
    /// Add all fields
    userId,
    userName,
    email,
    phone,
    password,
    gender,
  ];

  static const String userId = 'userId';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String password = 'password';
  static const String gender = 'gender';
}

class LocalUserModel {
  int? userId;
  String? userName;
  String? email;
  String? phone;
  String? password;
  String? gender;

  LocalUserModel({
    this.userId,
    this.userName,
    this.email,
    this.phone,
     this.password,
    this.gender,
  });

  LocalUserModel.fromJson(dynamic json) {
    userId = json['userId'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['userName'] = userName;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['gender'] = gender;
    return map;
  }
}
