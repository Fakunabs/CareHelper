import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/auth/views/new_password_view.dart';
import 'package:flutter_template/presentation/auth/widgets/custom_button_widget.dart';
import 'package:flutter_template/presentation/auth/widgets/header_phone_input_widget.dart';
import 'package:pinput/pinput.dart';

class PinAuthenView extends StatefulWidget {
  const PinAuthenView({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;

  @override
  State<PinAuthenView> createState() => _PinAuthenViewState();
}

class _PinAuthenViewState extends State<PinAuthenView> {
  static const Color _accent = Color(0xff112950);
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  _handleCorrectPin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const NewPasswordView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(21, 101, 192, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = _accent;

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          HeaderPhoneInputWidget(
            heading1: 'Confirmation',
            heading2: '6 digits have been sent to ${widget.phoneNumber}',
          ),
          const SizedBox(height: 24),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  // Specify direction if desired
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 6,
                    controller: pinController,
                    focusNode: focusNode,
                    defaultPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    validator: (value) {
                      return value == '222222' ? null : 'Incorrect PIN';
                    },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      height: 52,
                      width: 52,
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Haven\'t received the PIN?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text('Resend the PIN in 00:00'),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: const Size(0, 40),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Resend PIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomButtonWidget(
                    label: 'Continue',
                    onPressed: () {
                      focusNode.unfocus();
                      formKey.currentState!.validate()
                          ? _handleCorrectPin(context)
                          : null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
