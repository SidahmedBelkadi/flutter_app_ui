class ProductModel {
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  int? quantity;
  int? isActive;
  double? price;
  int? discount;
  int? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  int? favorite;

  ProductModel(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.image,
      this.quantity,
      this.isActive,
      this.price,
      this.discount,
      this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryImage,
      this.favorite});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    quantity = json['quantity'];
    isActive = json['is_active'];
    price = json['price'].toDouble();
    discount = json['discount'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['is_active'] = this.isActive;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_image'] = this.categoryImage;
    data['favorite'] = this.favorite;
    return data;
  }
}
