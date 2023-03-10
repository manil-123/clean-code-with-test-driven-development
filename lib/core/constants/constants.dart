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
  static const loginUrl = "/auth/logi";
  static const getProductsUrl = "/products";
}

class StringConstant {
  static const appName = 'E-commerce App';
  static const loginText = 'Login';
  static const logoutText = 'Log Out';
}

class SharedPreferencesConstants {
  static const authToken = "authToken";
}
