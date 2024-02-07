import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nuqood/models/payment_method_model.dart';
import 'package:nuqood/services/auth_service.dart';
import 'package:nuqood/shared/shared_values.dart';

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethod() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
          Uri.parse(
            '$baseUrlApp/payment_methods',
          ),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
      return List<PaymentMethodModel>.from(
        jsonDecode(res.body)
            .map(
              (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod),
            )
            .toList(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
