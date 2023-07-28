import 'dart:convert';
import 'dart:developer';

import 'package:bro_speak/domain/auth_model.dart';
import 'package:bro_speak/infrastructure/api/end_point.dart';
import 'package:bro_speak/infrastructure/common/tokens.dart';
import 'package:dio/dio.dart';

class AdminRepository {
  Dio dio = Dio();

  Future<String?> adminInvitationService(String email) async {
    String invitePath = ApiUrl.adminLevelBaseUrl + ApiUrl.newAdminInvite;
    final adminToken = await AllTokens().getAdminAccesToken();
    print(adminToken);

    AdminInviteModel inviteModel = AdminInviteModel(email: email);
    try {
      Response response = await dio.post(invitePath,
          data: jsonEncode(inviteModel.toJson()),
          options: Options(headers: {"authorization": "Bearer $adminToken"}));
      if (response.statusCode == 200) {
        
        return 'success';
      } else {
        return 'Something went wrong!';
      }
    } on DioException catch (e) {
      log(e.message.toString(), name: "Error invite");
      return e.message.toString();
    }
  }
}
