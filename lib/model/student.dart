class Student {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? bio;
  String? jobTitle;
  String? latitude;
  String? longitude;
  String? country;
  String? image;
  String? active;
  String? emailVerifiedAt;
  String? imagesCount;

  Student();

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    bio = json['bio'];
    jobTitle = json['job_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
    image = json['image'];
    active = json['active'];
    emailVerifiedAt = json['email_verified_at'];
    imagesCount = json['images_count'];
  }
}
