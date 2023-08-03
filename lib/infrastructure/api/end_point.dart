class ApiUrl {
  static String baseUrl = "http://10.4.4.107:3000/api/v1/";
  static String authLevelBaseUrl = "http://10.4.4.107:3000/api/v1/auth";
  static String adminLevelBaseUrl = "http://10.4.4.107:3000/api/v1/admin";

  // user endpoints
  static String signUp = "auth/signup";
  static String logIn = "auth/login";

  // admin endpoints 
  static String adminLogin = '/admin/login';
  static String adminSignUp = '/admin/signup';
  static String newAdminInvite = '/invite';
}
