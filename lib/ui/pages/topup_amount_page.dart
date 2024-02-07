import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nuqood/blocs/auth/auth_bloc.dart';
import 'package:nuqood/blocs/topup/topup_bloc.dart';
import 'package:nuqood/models/top_up_fom_model.dart';
import 'package:nuqood/shared/shared_methods.dart';
import 'package:nuqood/shared/theme.dart';
import 'package:nuqood/ui/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountPage extends StatefulWidget {
  final TopupFormModel data;
  const TopupAmountPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
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
    final text = amountController.text;
    int parsedValue = int.parse(text.replaceAll('.', ''));

    // Tentukan waktu penundaan (1 detik = 1000 milidetik)
    try {
      if (parsedValue < 10000) {
        // Jika kurang dari Rp 10.000, tampilkan alert
        showAlert('Warning !', 'Minimum Top Up is : ${formatCurrency(10000)}');

        //  Atur nilainya ke 0
        parsedValue = 0;
      } else if (parsedValue > 5000000) {
        // Jika lebih dari Rp 5.000.000, tampilkan alert
        showAlert(
            'Warning !', 'Maximum Top Up is :  ${formatCurrency(5000000)}');

        //  Atur nilainya kembali ke 0
        parsedValue = 0;
      } else {
        handleAmountChange();
        if (await Navigator.pushNamed(context, '/pin') == true) {
          Uri uri = Uri.parse('https://demo.midtrans.com/');
          launchUrl(uri);
          await Navigator.pushNamed(context, '/loading-page');
        }
      }
    } catch (e) {
      // Tampilkan atau tangani kesalahan parsing di sini
      print('Error parsing amount: $e');
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
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupFailed) {
              print("eroor top up");
              print(state.e);
              showCustomSnackBar(context, state.e);
            }
            if (state is TopupSuccess) {
              // await launch(state.redirectUrl);
              print("dibawah akan ada URL");
              Uri uri = Uri.parse(state.redirectUrl);
              print(state.redirectUrl);
              launchUrl(uri);
              await Navigator.pushNamed(context, '/loading-page');

              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                        amountController.text.replaceAll('.', ''),
                      ),
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/topup-success', (route) => false);
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 58,
              ),
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    'Total Amount',
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
                  title: 'Checkout Now',
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      final authState = context.read<AuthBloc>().state;
                      String pin = '';
                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }

                      context.read<TopupBloc>().add(
                            TopUpPost(
                              widget.data.copyWith(
                                pin: pin,
                                amount:
                                    amountController.text.replaceAll(".", ''),
                              ),
                            ),
                          );
                    }
                    // await Navigator.pushNamed(context, '/topup-success');
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
            );
          },
        ),
      ),
    );
  }
}
