import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nuqood/shared/theme.dart';
import 'package:nuqood/ui/widgets/buttons.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({super.key});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener((handleAmountChange));
  }

  void handleAmountChange() {
    final text = amountController.text;

    try {
      int parsedValue = int.parse(text.replaceAll('.', ''));

      final formattedValue = NumberFormat.currency(
        locale: 'id',
        decimalDigits: 0,
        symbol: '',
      ).format(parsedValue);

      amountController.value = amountController.value.copyWith(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    } catch (e) {
      // Tampilkan atau tangani kesalahan parsing di sini
      print('Error parsing amount: $e');
    }
  }

  void handleButtonClick() async {
    handleAmountChange();
    if (await Navigator.pushNamed(context, '/pin') == true) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/transfer-success',
        (route) => false,
      );
    }
  }

  void showAlert(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Tutup alert
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);

        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 58,
        ),
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              'Transfer Amount',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                cursorColor: greyColor,
                enabled: false,
                style: whiteTextStyle.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      top: 3,
                    ),
                    child: Text(
                      "Rp ",
                      style: whiteTextStyle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 66,
          ),
          Center(
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                CustomInputButton(
                  title: '1',
                  onTap: () {
                    addAmount('1');
                  },
                ),
                CustomInputButton(
                  title: '2',
                  onTap: () {
                    addAmount('2');
                  },
                ),
                CustomInputButton(
                  title: '3',
                  onTap: () {
                    addAmount('3');
                  },
                ),
                CustomInputButton(
                  title: '4',
                  onTap: () {
                    addAmount('4');
                  },
                ),
                CustomInputButton(
                  title: '5',
                  onTap: () {
                    addAmount('5');
                  },
                ),
                CustomInputButton(
                  title: '6',
                  onTap: () {
                    addAmount('6');
                  },
                ),
                CustomInputButton(
                  title: '7',
                  onTap: () {
                    addAmount('7');
                  },
                ),
                CustomInputButton(
                  title: '8',
                  onTap: () {
                    addAmount('8');
                  },
                ),
                CustomInputButton(
                  title: '9',
                  onTap: () {
                    addAmount('9');
                  },
                ),
                const SizedBox(
                  height: 60,
                  width: 60,
                ),
                CustomInputButton(
                  title: '0',
                  onTap: () {
                    addAmount('0');
                  },
                ),
                GestureDetector(
                  onTap: () {
                    deleteAmount();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: numberBackgroundColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 59,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              handleButtonClick();
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomtextButton(
            title: 'Terms & Conditions',
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
