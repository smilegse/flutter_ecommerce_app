

class AuthUtils {
  static String? token, firstName, lastName, mobile, city, email, shippingAddress;

  static Future<void> saveToken(String uToken) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //await sharedPreferences.setString('token', uToken);
    token = uToken;
  }

  static Future<void> saveUserData(
      String uFirstName,
      String uLastName,
      String uEmail,
      String uMobile,
      String uCity,
      String uShippingAddress) async {

    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // await sharedPreferences.setString('firstName', uFirstName);
    // await sharedPreferences.setString('lastName', uLastName);
    // await sharedPreferences.setString('email', uEmail);
    // await sharedPreferences.setString('mobile', uMobile);
    // await sharedPreferences.setString('city', uCity);
    // await sharedPreferences.setString('shippingAddress', uShippingAddress);

    firstName = uFirstName;
    lastName = uLastName;
    email = uEmail;
    mobile = uMobile;
    city = uCity;
    shippingAddress = uShippingAddress;
  }

  static Future<bool> checkLoginState() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String? token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getAuthData() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // token = sharedPreferences.getString('token');
    // firstName = sharedPreferences.getString('firstName');
    // lastName = sharedPreferences.getString('lastName');
    // email = sharedPreferences.getString('email');
    // mobile = sharedPreferences.getString('mobile');
    // city = sharedPreferences.getString('city');
    // shippingAddress = sharedPreferences.getString('shippingAddress');
  }

  static Future<void> clearData() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //await sharedPreferences.clear();
  }

}
