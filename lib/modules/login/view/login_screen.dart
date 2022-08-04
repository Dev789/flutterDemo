// import 'package:flutter_demo/forgot_password_screen.dart';
// import 'package:flutter_demo/otp_screen.dart';

import 'package:flutterbase/modules/core/utils/common_import.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Login/View/forgot_password_screen.dart';
import '../../Login/View/otp_screen.dart';
import '../../Login/View/registartion_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

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
        fillColor: HexColor('f2f2f2'),
        filled: true,
        hintText: hint,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(242, 242, 242, 1)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'login',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline2!,
                        Dimens.margin24,
                        FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 60,
                  child: addTextField(
                      'Enter email or mobile number',
                      false,
                      emailTextController,
                      TextInputType.emailAddress,
                      TextInputAction.next),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: addTextField(
                      'Enter password',
                      true,
                      passwordTextController,
                      TextInputType.text,
                      TextInputAction.done),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {
                      //Forgot Password Tapped
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPassWordScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      primary: Colors.transparent,
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero, // and this
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline5!,
                          Dimens.margin15,
                          FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Clicked on Login
                    //var emailText = emailTextController.text;
                    //var passwordText = passwordTextController.text;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.colorCyanSky,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'login',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline4!,
                        Dimens.margin16,
                        FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline1!,
                          Dimens.margin14,
                          FontWeight.normal),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        //Tapped Register Now
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationScreen(
                                      abc: 'Registration',
                                    ),
                                settings: const RouteSettings(
                                  arguments: true,
                                )));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero, // and this
                      ),
                      child: Text(
                        'Register Now',
                        style: getTextStyle(
                            Theme.of(context).primaryTextTheme.headline5!,
                            Dimens.margin14,
                            FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
