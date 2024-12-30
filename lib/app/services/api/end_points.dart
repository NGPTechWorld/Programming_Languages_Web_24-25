class EndPoints {
  static const String baserUrl = "http://192.168.1.2:8000/api";

  //Admin
  static const String addMarket = "/admins/addMarket";
  static const String addAdmin = "/admins/addAdmin";
  static const String editMarket = "/admins/editMarket/"; //{manager}
  static const String completeOrder = "/admins/completeOrder/"; //{order}
  static const String deliverOrder = "/admins/deliverOrder/"; //{order}
  static const String rejectOrder = "/admins/rejectOrder/"; //{order}
  static const String deleteMarket = "/admins/deleteMarket/"; //{manager}
  static const String delete = "/admins/delete/"; //{product}
  static const String getMarkets = "/admins/getMarkets";
  static const String getProducts = "/admins/getProducts/"; //{market}
  static const String getTopProducts = "/admins/getTopProducts";
  static const String getTopProductsMarket =
      "/admins/getTopProducts/"; //{market}
  static const String getAllOrders = "/admins/getAllOrders";
  static const String getMarketOrders = "/admins/getMarketOrders/"; //{order}
  static const String getMarketOrdersByStatus =
      "/admins/getMarketOrdersByStatus/"; //{order}/{status}
  static const String getOrders = "/admins/getOrders/"; //{market}
  static const String getOrdersByStatus =
      "/admins/getOrdersByStatus/"; //{status}
  static const String getOrder = "/admins/getOrder/"; //{order}
  static const String statisticsAdmin = "/admins/statistics";

  //managers
  static const String loginManager = "/managers/login";
  static const String logoutmMnager = "/managers/logout";
  static const String refreshTokenManager = "/managers/refreshToken";
  static const String resetPasswordManager = "/managers/resetPassword";
  static const String checkTokenManager = "/managers/checkToken";
  static const String currentManager = "/managers/currentManager";

  //Seller
  static const String addProductSeller = "/sellers/addProduct";
  static const String uploadImageSeller = "/sellers/uploadImage";
  static const String uploadImageProduct = "/sellers/uploadImage/"; //{product}
  static const String editSeller = "/sellers/edit/"; //{product}
  static const String completeOrderSeller = "/sellers/completeOrder/"; //{order}
  static const String rejectOrderSeller = "/sellers/rejectOrder/"; //{order}
  static const String deleteProduct = "/sellers/delete/"; //{product}
  static const String deleteImage = "/sellers/deleteImage";
  static const String deleteImageProduct = "/sellers/deleteImage/"; //{product}
  static const String getProductsSeller = "/sellers/getProducts";
  static const String getProductSeller = "/sellers/getProduct/";
  static const String getTopProductsSeller = "/sellers/getTopProducts";
  static const String getImage = "/sellers/getImage";
  static const String getImageProduct = "/sellers/getImage/"; //{product}
  static const String getOrdersSeller = "/sellers/getOrders";
  static const String getOrdersByStatusSeller =
      "/sellers/getOrdersByStatus/"; //{status}
  static const String getOrderSeller = "/sellers/getOrder/"; //{order}
  static const String statisticsSeller = "/sellers/statistics";

  // Category
  static const String getAllCategories = "/categories/getAll";
  static const String getCategory = "/categories/get/{category}";
  static const String test = "test";
}

class ApiKey {
  static String id = "id";
  static String category = "category";
  static String name = "name";
  static String name_en = "name_en";
  static String email = "email";
  static String first_name = "first_name";
  static String last_name = "last_name";
  static String number = "number";
  static String password = "password";
  static String password_confirmation = "password_confirmation";
  static String message = "message";
  static String bearerToken = "Bearer Token";
  static String errors = "errors";
  static String userName = "user_name";
  static String validationFailed = "Validation failed";
  static String verify_code = "verify_code";
  static String location = "location";
  static String street = "street";
  static String notes = "notes";
  //---------------------------------------
  static String user = "user";
  static String date = "date";
  static String orders = "orders";
  static String price = "price";
  static String total = "total";
  static String count = "count";
  static String markets = "markets";
  static String products = "products";
  static String location_name = "location_name";
  static String total_cost = "total_cost";
  static String status_id = "status_id";
  static String locations = "locations";
  static String old_password = "old_password";
  static String new_password = "new_password";
  static String new_password_confirmation = "new_password_confirmation";
  static String image_path = "image_path";

  static String categories = "categories";
  static String image = "image";
  static String market_name = "market_name";
  static String category_name = "category_name";
  static String market_id = "market_id";
  static String currentPageItems = "currentPageItems";
  static String perPage = "perPage";
  static String page = "page";

  //---------------------------------------
}
