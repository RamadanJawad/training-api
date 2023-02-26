class UserImage {
  int? id;
  String? image;
  String? info;
  String? userId;
  String? visible;

  UserImage();

  UserImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    info = json['info'];
    userId = json['user_id'];
    visible = json['visible'];
  }
}