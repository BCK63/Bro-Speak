import 'dart:convert';
import 'dart:developer';

import 'package:bro_speak/domain/auth_model.dart';
import 'package:bro_speak/infrastructure/api/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  Dio dio = Dio();
  String signUpPath = ApiUrl.baseUrl + ApiUrl.signUp;
  String logInPath = ApiUrl.baseUrl + ApiUrl.logIn;
  Future<String?> signUpService(
      String email, String name, String password, String batch) async {
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

  Future<String> logInServices(String email, String password) async {
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
        return "Invalid email or password";
      }
    } on DioException catch (e) {
      log(e.message.toString());

      return "Error";
    }
    return "";
  }
}
