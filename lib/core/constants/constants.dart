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
  static const descriptionText = 'Description:';
  static const ratingText = 'Ratings:';

  static const productDetailText =
      "Introducing the newest addition to our product line - a sleek and modern smartphone designed to keep you connected and productive on-the-go. With its powerful processor, long-lasting battery, and stunning high-resolution display, this device is the perfect tool for both work and play. Its lightweight and durable design make it easy to carry with you wherever you go, while its advanced camera system captures all of life's memorable moments in stunning detail.";
}

class SharedPreferencesConstants {
  static const authToken = "authToken";
}
