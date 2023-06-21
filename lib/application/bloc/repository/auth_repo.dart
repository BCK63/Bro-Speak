import 'dart:convert';
import 'dart:developer';

import 'package:bro_speak/domain/auth_model.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Dio dio = Dio();
  String path = "http://10.4.4.63:3000/api/v1/auth/signup";
  Future<String?> signUpService(
      String email, String name, String password, String batch) async {
    AuthSignUpModel authSignUpModel = AuthSignUpModel(
        batch: batch, email: email, name: name, password: password);
    try {
      Response response =
          await dio.post(path, data: jsonEncode(authSignUpModel.toJson()));
      if (response.statusCode == 201) {
        return "success";
      }else if(response.statusCode == 400){
        return "email already exist";
      }
    } on DioException catch (e) {
      log(e.message.toString(), name: "Error");
      return e.message;
    }
    return null;
  }
}
