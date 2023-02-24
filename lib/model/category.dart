class Categorys {
  int? id;
  String? title;
  String? description;
  String? image;
  String? visible;
  String? productsCount;

  Categorys();

  Categorys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    visible = json['visible'];
    productsCount = json['products_count'];
  }
}
