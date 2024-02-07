import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nuqood/services/auth_service.dart';
import 'package:nuqood/shared/shared_values.dart';

class WalletService {
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
          Uri.parse(
            '$baseUrlApp/wallets',
          ),
          body: {
            'previous_pin': oldPin,
            'new_pin': newPin,
          },
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
