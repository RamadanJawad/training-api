class StudentImage {
  int? id;
  String? image;
  int? studentId;
  String? imageUrl;

  StudentImage();

  StudentImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    if (json['student_id'] is int) {
      studentId = json['student_id'];
    } else {
      studentId = int.parse(json['student_id']);
    }

    imageUrl = json['image_url'];
  }
}
