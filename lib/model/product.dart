class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  String? visible;
  String? quantity;
  String? color;
  String? categoryId;

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    visible = json['visible'];
    quantity = json['quantity'];
    color = json['color'];
    categoryId = json['category_id'];
  }
}
