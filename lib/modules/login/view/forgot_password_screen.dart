import 'package:flutter/material.dart';
import '../../core/api_service/common_service.dart';
import '../../core/utils/app_dimens.dart';

class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassWordScreen> createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {
  var emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    'Forgot Password?',
                    style: getTextStyle(Theme.of(context).primaryTextTheme.headline2!, Dimens.margin24, FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 50, right: 50),
                      child: Text(
                        'We will sent you a link to reset your password',
                        style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!, Dimens.margin16, FontWeight.normal),
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: false,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailTextController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      fillColor: Theme.of(context).dialogBackgroundColor,
                      filled: true,
                      hintText: 'Enter email or mobile number',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).dividerColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child:  Text(
                      'Submit',
                      style: getTextStyle(Theme.of(context).primaryTextTheme.headline4!, Dimens.margin16, FontWeight.normal),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
