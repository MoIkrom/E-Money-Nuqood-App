import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:nuqood/models/top_up_fom_model.dart';
import 'package:nuqood/services/auth_service.dart';
import 'package:nuqood/shared/shared_values.dart';

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrlApp/top_ups',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );
      print(res.body);

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> ClearCredentialUser() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
