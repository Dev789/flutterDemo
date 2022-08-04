import 'package:flutter/gestures.dart';
import 'package:pinput/pinput.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';

import '../../drawer/view/my_drawer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  ValueNotifier<String> firstNotifier = ValueNotifier<String>('');
  var otpTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 25),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Verification',
                  style: getTextStyle(
                      Theme.of(context).primaryTextTheme.headline2!,
                      Dimens.margin24,
                      FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    'Please type verification code sent to +1 9999 999999',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin16,
                        FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildPinPut(),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Didn’t get the  OTP? ',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin14,
                        FontWeight.normal),
                  ),
                  TextSpan(
                      text: 'Resend OTP',
                      style: TextStyle(
                          fontSize: 15, color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          otpTextController.clear();
                        }),
                ])),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (otpTextController.text.isEmpty) {
                    } else {}
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'Verify',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline4!,
                        Dimens.margin16,
                        FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPinPut() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
          Dimens.margin14, FontWeight.normal),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        border: Border.all(color: Theme.of(context).dialogBackgroundColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).dialogBackgroundColor),
      borderRadius: BorderRadius.circular(8),
    );
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme,
      controller: otpTextController,
      validator: (s) {
        setState(() {});
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => debugPrint(pin),
    );
  }
}
