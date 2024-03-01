class CartModel {
  int? userId;
  int? productId;
  String? productName;
  String? productImage;
  double? productPrice;
  int? productCount;
  double? totalPricePerProduct;
  String? latestCartCreatedAt;

  CartModel(
      {this.userId,
      this.productId,
      this.productName,
      this.productImage,
      this.productPrice,
      this.productCount,
      this.totalPricePerProduct,
      this.latestCartCreatedAt});

  CartModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productPrice = json['product_price'].toDouble();
    productCount = json['product_count'];
    totalPricePerProduct = json['total_price_per_product'].toDouble();
    latestCartCreatedAt = json['latest_cart_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_price'] = this.productPrice;
    data['product_count'] = this.productCount;
    data['total_price_per_product'] = this.totalPricePerProduct;
    data['latest_cart_created_at'] = this.latestCartCreatedAt;
    return data;
  }
}
