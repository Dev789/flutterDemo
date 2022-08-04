// import 'package:flutter_demo/login_screen.dart';
// import 'package:flutter_demo/registartion_screen.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Login/View/login_screen.dart';
import '../../Login/View/registartion_screen.dart';

//TODO:- Colors Data =======================
//var separatorsColor = const Color.fromRGBO(217, 225, 228, 1.0);
var primaryColor = const Color.fromRGBO(6, 187, 179, 1.0);
var descLabelTextColor = HexColor('8e8f90');
var titleLabelTextColor = HexColor('333333');
var backgroundColor = HexColor('00bbb3');

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    //Widget for the social media login button
    Widget socialMediaButtons() {
      return Column(
        children: [
          Material(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                //click on Facebook
              },
              child: Container(
                padding: const EdgeInsets.only(left: 40),
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(24, 118, 210, 1.0),
                    borderRadius: BorderRadius.circular(0.0)),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Icon(Icons.facebook_rounded, size: 40,color: Colors.white,),
                    Image.asset(
                      APPImages.iconFacebook,
                      height: 40,
                      width: 40,
                    ),

                    const SizedBox(width: 30),
                    Text(
                      'Continue with Facebook',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline4!,
                          Dimens.margin16,
                          FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Material(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                //click on Facebook
              },
              child: Container(
                padding: const EdgeInsets.only(left: 40),
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.0),
                  border: Border.all(color: AppColors.colorAntiFlashWhite),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset(
                      APPImages.iconGoogle,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      'Continue with Google',
                      style: getTextStyle(
                          Theme.of(context).primaryTextTheme.headline3!,
                          Dimens.margin16,
                          FontWeight.normal),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    //Widget OR Portion
    Widget orPortion() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                height: 1,
                color: AppColors.colorAntiFlashWhite,
              ),
            ),
            Text(
              'Or',
              style: getTextStyle(Theme.of(context).primaryTextTheme.headline2!,
                  Dimens.margin16, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 1,
                color: AppColors.colorAntiFlashWhite,
              ),
            )
          ],
        ),
      );
    }

    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Image.asset('images/img_logo.png',
                    height: 150,
                    width: 150,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                        child: ElevatedButton(

                          onPressed: () {
                            print('Clicked on SignUP');
                          },
                          child: const Text('Sign Up', style: TextStyle(fontSize: 17),),
                          style: ElevatedButton.styleFrom(
                            primary: _primaryColor,
                            minimumSize: const Size.fromHeight(50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            print('Clicked on Continue as a Guest');
                          },
                          child: const Text('Continue as a Guest', style: TextStyle(fontSize: 17,color: const Color.fromRGBO(6, 187, 179, 1.0)),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Color.fromRGBO(6, 187, 179, 1.0) , width: 1.0),
                                borderRadius: BorderRadius.circular(0)
                            ),
                          ),
                        ),
                      ),
                      orSeperators(),
                      socialMediaButtons(),
                      const SizedBox(height: 30,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?',style: TextStyle(color: Color.fromRGBO(143, 144, 146, 1),fontSize: 17),),
                          const SizedBox(width: 5),
                          // FlatButton(
                          //   materialTapTargetSize: MaterialTapTargetSize.padded,
                          //   child: Text('Sign In', style: TextStyle(fontSize: 17,color: _primaryColor),textAlign: TextAlign.left,),
                          //   onPressed: () {},
                          // ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                              minimumSize: Size.zero, // Set this
                              padding: EdgeInsets.zero, // and this
                            ),
                            child: Text('Sign In', style: TextStyle(fontSize: 17,color: _primaryColor),textAlign: TextAlign.left,),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
      ),
        ),
      ),
    );*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Image.asset(
                    APPImages.imgLogo,
                    height: 150,
                    width: 150,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        //Clicked on SignUP
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationScreen(
                                    abc: 'Registration'),
                                settings: const RouteSettings(
                                  arguments: false,
                                )));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text(
                        'Sign Up',
                        style: getTextStyle(
                            Theme.of(context).primaryTextTheme.headline4!,
                            Dimens.margin16,
                            FontWeight.normal),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        //Clicked on Continue as a Guest
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color.fromRGBO(6, 187, 179, 1.0),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      child: Text(
                        'Continue as a Guest',
                        style: getTextStyle(
                            Theme.of(context).primaryTextTheme.headline5!,
                            Dimens.margin16,
                            FontWeight.normal),
                      ),
                    ),
                  ),
                  orPortion(),
                  socialMediaButtons(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: getTextStyle(
                            Theme.of(context).primaryTextTheme.headline1!,
                            Dimens.margin14,
                            FontWeight.normal),
                      ),
                      const SizedBox(width: 5),
                      // FlatButton(
                      //   materialTapTargetSize: MaterialTapTargetSize.padded,
                      //   child: Text('Sign In', style: TextStyle(fontSize: 17,color: _primaryColor),textAlign: TextAlign.left,),
                      //   onPressed: () {},
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        child: Text('Sign In',
                            style: getTextStyle(
                                Theme.of(context).primaryTextTheme.headline5!,
                                Dimens.margin14,
                                FontWeight.normal)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
