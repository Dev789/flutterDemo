import 'package:flutter/gestures.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';
import '../../Login/View/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  //const RegistrationScreen({Key? key}) : super(key: key);
  final String? abc;
  const RegistrationScreen({Key? key, required this.abc}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var fullNameTextField = TextEditingController();
  var emailAddressTextField = TextEditingController();
  var mobileNumberTextField = TextEditingController();
  var passWordTextField = TextEditingController();
  var confirmPasswordTextField = TextEditingController();

  Widget addTextField(
      String hint,
      bool isSecure,
      TextEditingController controller,
      TextInputType keyboardType,
      TextInputAction textInputAction) {
    return TextField(
      obscureText: isSecure,
      maxLines: 1,
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        fillColor: Theme.of(context).dialogBackgroundColor,
        filled: true,
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isFromLoginSceen = ModalRoute.of(context)!.settings.arguments as bool;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  widget.abc!,
                  style: getTextStyle(
                      Theme.of(context).primaryTextTheme.headline2!,
                      Dimens.margin24,
                      FontWeight.normal),
                ),
                const SizedBox(
                  height: 40,
                ),
                addTextField('Full Name', false, fullNameTextField,
                    TextInputType.name, TextInputAction.next),
                const SizedBox(
                  height: 15,
                ),
                addTextField('Email Address', false, emailAddressTextField,
                    TextInputType.emailAddress, TextInputAction.next),
                const SizedBox(
                  height: 15,
                ),
                addTextField('Mobile Number', false, mobileNumberTextField,
                    TextInputType.phone, TextInputAction.next),
                const SizedBox(
                  height: 15,
                ),
                addTextField('Password', true, passWordTextField,
                    TextInputType.text, TextInputAction.next),
                const SizedBox(
                  height: 15,
                ),
                addTextField('Confirm Password', true, confirmPasswordTextField,
                    TextInputType.text, TextInputAction.done),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'By continuing, you’re agree to our ',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin14,
                        FontWeight.normal),
                  ),
                  TextSpan(
                      text: 'Term & Condition ',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline5!,
                          Dimens.margin14,
                          FontWeight.normal),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('click Terms and conditions');
                        }),
                  TextSpan(
                    text: 'and ',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin14,
                        FontWeight.normal),
                  ),
                  TextSpan(
                      text: 'Privacy Policy.',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline5!,
                          Dimens.margin14,
                          FontWeight.normal),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('click privacy and policy');
                        }),
                ])),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'Continue',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline4!,
                        Dimens.margin16,
                        FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Already have an account? ',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin14,
                        FontWeight.normal),
                  ),
                  TextSpan(
                      text: 'Sign In',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline5!,
                          Dimens.margin14,
                          FontWeight.normal),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (isFromLoginSceen) {
                            Navigator.pop(context);
                            debugPrint('inside isFromLogin');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          }
                          debugPrint('Click on sign in');
                        })
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
