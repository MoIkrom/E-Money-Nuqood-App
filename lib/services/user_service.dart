import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nuqood/models/user_edit_form_model.dart';
import 'package:nuqood/services/auth_service.dart';
import 'package:nuqood/shared/shared_values.dart';

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
          Uri.parse(
            '$baseUrlApp/users',
          ),
          body: data.toJson(),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
