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
  double? discountPrice;
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
      this.discountPrice,
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
    discountPrice = json['discount_price'].toDouble();
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['image'] = image;
    data['quantity'] = quantity;
    data['is_active'] = isActive;
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_name_ar'] = categoryNameAr;
    data['category_image'] = categoryImage;
    data['favorite'] = favorite;
    return data;
  }
}
