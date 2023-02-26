class Search {
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

  Search(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.bio,
      this.jobTitle,
      this.latitude,
      this.longitude,
      this.country,
      this.image,
      this.active,
      this.emailVerifiedAt});

  Search.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['bio'] = this.bio;
    data['job_title'] = this.jobTitle;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['country'] = this.country;
    data['image'] = this.image;
    data['active'] = this.active;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}