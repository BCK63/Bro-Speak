import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AllTokens{

  Future<String> getAdminAccesToken() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? accesToken = await storage.read(key: 'admin_access_token');
    String? token = accesToken!.replaceAll('"', '');
    String ogToken = token.replaceAll('Bearer ', '');
    print(ogToken);
    return ogToken;
  }
}