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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_user_id'] = this.favoriteUserId;
    data['favorite_product_id'] = this.favoriteProductId;
    data['favorite_creation_date'] = this.favoriteCreationDate;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
