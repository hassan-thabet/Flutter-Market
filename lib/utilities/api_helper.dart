class ApiHelper {
  // MAIN SERVER URL
  static const String MAIN_API_URL = "http://10.0.2.2:8000/api/";
  static const String MAIN_IMAGES_URL = "http://10.0.2.2:8000/images/";

  // AUTH URLs
  static const String AUTH_LOGIN = MAIN_API_URL + 'auth/login';
  static const String AUTH_REGISTER = MAIN_API_URL + 'auth/register';

  static const String CATEGORIES = MAIN_API_URL + 'categories';
  static const String SUBCATEGORIES = MAIN_API_URL + 'category-subcategories';
  static const String BRANDS = MAIN_API_URL + 'category-brands';

  static const String PRODUCTS = MAIN_API_URL + 'products';
  static const String SUBCATEGORY_PRODUCTS = MAIN_API_URL + 'subcategories';
  static const String BRAND_PRODUCTS = MAIN_API_URL + 'brands';

  static const String CARTS = MAIN_API_URL + 'carts';
}
