import "package:another_flushbar/flushbar.dart";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nuqood/shared/theme.dart';
import 'package:image_picker/image_picker.dart';

void showCustomSnackBar(BuildContext context, String message) {
  Flushbar(
    messageText: Center(
      child: Text(
        message,
        style: TextStyle(
          color: whiteColor, // Sesuaikan dengan warna teks yang Anda inginkan
        ),
      ),
    ),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(num number, {String symbol = "Rp "}) {
  return NumberFormat.currency(locale: 'id', symbol: symbol, decimalDigits: 0)
      .format(number);
}

Future<XFile?> selectImage() async {
  final XFile? selectedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  return selectedImage;
}
