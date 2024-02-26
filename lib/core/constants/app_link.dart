class AppLink {
  static const localhost = "http://192.168.1.4:8080";
  static const String server = "http://192.168.1.4:8080/api/v1";
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

  // ============================================= Categories ==========================//
  static const String allProducts = "$server/products";
}
