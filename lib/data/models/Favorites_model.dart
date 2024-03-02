class FavoritesModel {
  int? favoriteId;
  int? favoriteUserId;
  int? favoriteProductId;
  String? favoriteCreationDate;
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
  String? createdAt;
  String? updatedAt;

  FavoritesModel(
      {this.favoriteId,
      this.favoriteUserId,
      this.favoriteProductId,
      this.favoriteCreationDate,
      this.id,
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
      this.createdAt,
      this.updatedAt});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserId = json['favorite_user_id'];
    favoriteProductId = json['favorite_product_id'];
    favoriteCreationDate = json['favorite_creation_date'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_user_id'] = favoriteUserId;
    data['favorite_product_id'] = favoriteProductId;
    data['favorite_creation_date'] = favoriteCreationDate;
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
    data['discount_price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
