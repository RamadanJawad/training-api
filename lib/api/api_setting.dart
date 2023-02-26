class ApiSetting {
  static const _baseApi = "http://demo-api.mr-dev.tech/api/";
  static const login = "${_baseApi}students/auth/login";
  static const register = "${_baseApi}students/auth/register";
  static const users = "${_baseApi}users";
  static const categories = "${_baseApi}categories";
  static const countries = "${_baseApi}countries";
  static const search = "${_baseApi}users/search";

  static String getCategoryProductUrl(int id) {
    return "${_baseApi}categories/$id/products";
  }

  static String getUserImagesUrl(int id) {
    return "${_baseApi}users/$id/images";
  }
}
