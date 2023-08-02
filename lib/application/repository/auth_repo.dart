import 'dart:convert';
import 'dart:developer';

import 'package:bro_speak/domain/auth_model.dart';
import 'package:bro_speak/infrastructure/api/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  Dio dio = Dio();

  Future<String?> signUpService(
      String email, String name, String password, String batch) async {
    String signUpPath = ApiUrl.baseUrl + ApiUrl.signUp;

    AuthSignUpModel authSignUpModel = AuthSignUpModel(
        batch: batch, email: email, name: name, password: password);
    try {
      Response response = await dio.post(signUpPath,
          data: jsonEncode(authSignUpModel.toJson()));
      if (response.statusCode == 201) {
        return "success";
      } else if (response.statusCode == 400) {
        return "email already exist";
      }
    } on DioException catch (e) {
      log(e.message.toString(), name: "Error");
      return e.message;
    }
    return null;
  }

  Future<String?> logInServices(String email, String password) async {
    String logInPath = ApiUrl.baseUrl + ApiUrl.logIn;

    FlutterSecureStorage storage = const FlutterSecureStorage();
    log("entering here");
    try {
      Response response = await dio
          .post(logInPath, data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        log(response.data.toString(), name: "Login");
        String accessToken = response.data["results"]["token"]["accessToken"];
        String refreshToken = response.data["results"]["token"]["refreshToken"];

        await storage.write(key: "access_token", value: accessToken);
        await storage.write(key: "refresh_token", value: refreshToken);

        log(accessToken.toString(), name: "access_token");
        log(refreshToken.toString(), name: "refresh_token");

        return "success";
      } else if (response.statusCode == 404) {
        return "User not found";
      } else if (response.statusCode == 401) {
        log("entering in wrror log", name: "Invalid username");
        return "Invalid email or password";
      }

    } on DioException catch (e) {
      log(e.message.toString());

      return e.message.toString();
    }
    return null;
  }

  Future<String?> adminLogInServices(String email, String password) async {
    String adminLoginPath = ApiUrl.authLevelBaseUrl + ApiUrl.adminLogin;
    FlutterSecureStorage storage = const FlutterSecureStorage();
    log("entering here");
    try {
      Response response = await dio
          .post(adminLoginPath, data: {"email": email, "password": password});
      log(response.toString());
      if (response.statusCode == 200) {
        log(response.data.toString(), name: "Login");
        String accessToken = response.data["results"]["accessToken"];
        String refreshToken = response.data["results"]["refreshToken"];

        await storage.write(key: "admin_access_token", value: accessToken);
        await storage.write(key: "admin_refresh_token", value: refreshToken);

        log(accessToken.toString(), name: "access_token");
        log(refreshToken.toString(), name: "refresh_token");

        return "admin login success";
      } else if (response.statusCode == 404) {
        return "User not found";
      } else if (response.statusCode == 401) {
        log("entering in error log", name: "Invalid username");
        return "Invalid email or password";
      }
    } on DioException catch (e) {
      log(e.message.toString());

      return e.message!;
    }
    return null;
  }

  Future<String?> adminSignUpServices(
      String name, String email, String password, String token) async {
    final adminSignupPath = ApiUrl.authLevelBaseUrl + ApiUrl.adminSignUp;
    log("entering here");
    try {
      AdminSignUpModel dataModel = AdminSignUpModel(
          email: email, name: name, password: password, token: token);
      Response response =
          await dio.post(adminSignupPath, data: jsonEncode(dataModel.toJson()));
      log(response.toString());
      if (response.statusCode == 200) {
        log(response.data.toString(), name: "signup success response");
        return "admin signup success";
      } else {
        return 'Something went wrong!';
      }
    } on DioException catch (e) {
      log(e.message.toString(), name: "Singup Error");
      if (e.message.toString() ==
          'The request returned an invalid status code of 400.') {
        return "Email Not Matching with Invited Mail";
      } else {
        return 'Something went wrong!';
      }
    }
  }
}
