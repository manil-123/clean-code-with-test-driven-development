class ErrorMessage {
  static const serverFailureMessage = "Server failure";
  static const cacheFailureMessage = "Cache failure";
  static const internetFailureMessage = "No internet connection";
  static const socketExceptionMessage = "Connection failed";
  static const somethingWentWrongFailureMessage = 'Something went wrong!!';
  static const unauthorisedErrorMessage = 'Unauthorised';
  static const notFoundErrorMessage = '404 Not Found';
}

class ApiEndpoints {
  static const loginUrl = "/auth/login";
  static const getProductsUrl = "/products";
  static const categoriesUrl = "/products/categories";
  static const profileUrl = "/users/1";
}

class StringConstant {
  static const appName = 'E-commerce App';
  static const loginText = 'Login';
  static const logoutText = 'Log Out';
  static const editProfileText = 'Edit Profile';
  static const changePasswordText = 'Change Password';
}

class SharedPreferencesConstants {
  static const authToken = "authToken";
}
