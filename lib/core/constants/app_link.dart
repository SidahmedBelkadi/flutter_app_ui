class AppLink {
  static const localhost = "http://192.168.1.2:8080";
  static const String server = "http://192.168.1.2:8080/api/v1";
  static const String test = "$server/test";

// ============================================= Static Images ==========================//

  static const String staticCategoriesImages =
      "$localhost/images/static/categories";
  static const String staticProductsImages =
      "$localhost/images/static/products";

// ============================================= Auth ==========================//
  static const String signUpEmailVerification = "$server/register-verification";
  static const String register = "$server/register";
  static const String login = "$server/login";
  static const String logout = "$server/logout";
  static const String forgotPassword = "$server/forgot-password";
  static const String verifyCode = "$server/verify-code";
  static const String resetpassword = "$server/reset-password";

// ============================================= Categories ==========================//
  static const String allCategories = "$server/categories";

  // ============================================= Products ==========================//
  static const String allProducts = "$server/products";

  // ============================================= Favorites Products ==========================//
  static const String allFavoritesProducts = "$server/favorites";
  static const String addProductToFavorites = "$server/add-product-favorites";
  static const String removeProductFromFavorites =
      "$server/remove-product-favorites";
  static const String deleteProductFRomfavoritesList =
      "$server/delete-product-favorites";
}
