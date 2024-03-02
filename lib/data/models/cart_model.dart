class CartModel {
  int? userId;
  int? productId;
  String? productName;
  String? productImage;
  double? productPrice;
  double? productDicountPrice;
  int? productCount;
  double? totalPricePerProduct;
  double? totalDiscountPricePerProduct;
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
    productDicountPrice = json['discount_price'].toDouble();
    productCount = json['product_count'];
    totalPricePerProduct = json['total_price_per_product'].toDouble();
    totalDiscountPricePerProduct =
        json['total_discount_price_per_product'].toDouble();
    latestCartCreatedAt = json['latest_cart_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['product_price'] = productPrice;
    data['discount_price'] = productDicountPrice;
    data['product_count'] = productCount;
    data['total_price_per_product'] = totalPricePerProduct;
    data['total_discount_price_per_product'] = totalDiscountPricePerProduct;
    data['latest_cart_created_at'] = latestCartCreatedAt;
    return data;
  }
}
