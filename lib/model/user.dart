class User {
  int? id;
  String? fullName;
  String? email;
  String? gender;
  Null? verificationCode;
  Null? fcmToken;
  String? token;
  String? refreshToken;
  bool? isActive;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    gender = json['gender'];
    verificationCode = json['verification_code'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isActive = json['is_active'];
  }
}
