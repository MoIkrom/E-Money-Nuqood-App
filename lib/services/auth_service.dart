import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nuqood/models/sign_up_form_model.dart';
import 'package:nuqood/models/user_model.dart';
import 'package:nuqood/shared/shared_values.dart';

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
          Uri.parse(
            '$baseUrlApp/is-email-exist',
          ),
          body: {
            'email': email,
          });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      print(data.toJson());
      final res = await http.post(
        Uri.parse(
          '$baseUrlApp/register',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(
          password: data.password,
        );
        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
