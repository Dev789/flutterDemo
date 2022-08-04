import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbase/modules/auth/bloc/auth_bloc.dart';
import 'package:flutterbase/modules/core/api_service/preference_helper.dart';
import 'package:flutterbase/modules/core/common/widgets/app_localizations.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'modules/auth/repository/repository_auth.dart';
import 'modules/core/theme_cubit/theme_cubit.dart';
import 'modules/splash/view/screen_splash.dart';

/// Used by [MyApp] StatefulWidget for init of app
///[MultiProvider] A provider that merges multiple providers into a single linear widget tree.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MaterialAppWidget(),
    );
  }
}

///[MaterialAppWidget] This class use to Material App Widget
class MaterialAppWidget extends StatefulWidget {
  const MaterialAppWidget({Key? key}) : super(key: key);

  static ValueNotifier<Locale> notifier =
      ValueNotifier<Locale>(const Locale(APPStrings.languageEn));

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

///[MyAppState] This class use to My App State
class MyAppState extends State<MaterialAppWidget> {
  late ApiProvider apiProvider;
  late http.Client client;

  ValueNotifier<bool> isDrawerClose = ValueNotifier<bool>(false);

  @override
  void initState() {
    init();
    bool value = Hive.box('themeBox').get('themeData') ?? true;
    value
        ? BlocProvider.of<ThemeCubit>(context).setThemeDataLight()
        : BlocProvider.of<ThemeCubit>(context).setThemeDataDark();

    super.initState();
  }

  void init() {
    PreferenceHelper.load().whenComplete(() {
      updateLanguage();
      apiProvider = ApiProvider();
      client = http.Client();
    });
  }

  @override
  Widget build(BuildContext context) {
    addingMobileUiStyles(context);
    return ValueListenableBuilder<Locale>(
      builder: (BuildContext context, Locale newLocale, Widget? child) {
        return MultiProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(
                  apiProvider: apiProvider,
                  client: client,
                  repositoryAuth: RepositoryAuth()),
            ),
          ],
          child: MultiValueListenableBuilder(
              valueListenables: [isDrawerClose],
              builder: (BuildContext context, values, Widget? child) {
                return BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: APPStrings.appName,
                      theme: getTheme(state.themeData, context),
                      locale: newLocale,
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        AppLocalizations.delegate
                      ],
                      supportedLocales: const [
                        Locale(APPStrings.languageEn, ''), // English
                        Locale(APPStrings.languageAr, '') //
                      ],
                      debugShowMaterialGrid: false,
                      showSemanticsDebugger: false,
                      showPerformanceOverlay: false,
                      navigatorKey: NavigatorKey.navigatorKey,
                      initialRoute: AppRoutes.routesSplash,
                      home: const ScreenSplash(),
                      onGenerateRoute: RouteGenerator.generateRoute,
                    );
                  },
                );
              }),
        );
      },
      valueListenable: MaterialAppWidget.notifier,
    );
  }

  ///[getTheme] This method use to ThemeData of current app
  ThemeData getTheme(theme, BuildContext context) {
    if (theme == 'dark') {
      return darkThemeData(context);
    } else if (theme == 'light') {
      return lightThemeData(context);
    } else if (Hive.box('themeBox').get('themeData') != null) {
      return Hive.box('themeBox').get('themeData')
          ? darkThemeData(context)
          : lightThemeData(context);
    } else {
      return lightThemeData(context);
    }
  }

  ///[lightThemeData] This method use to ThemeData of light Theme Data
  ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.colorPrimary,
      backgroundColor: AppColors.colorWhite,
      canvasColor: AppColors.colorGrey,
      cardColor: AppColors.colorWhite,
      indicatorColor: AppColors.colorRed,
      hintColor: AppColors.colorPhilippineGray,
      dialogBackgroundColor: AppColors.colorAntiFlashWhite, //f2f2f2
      dividerColor: AppColors.colorAntiFlashWhiteBorder, //f0f0f0
      shadowColor: AppColors.colorCultured,
      primaryTextTheme: TextTheme(
        headline1: AppFont.mediumPhilippineGray,
        headline2: AppFont.mediumDarkCharcoal,
        headline3: AppFont.mediumBlack,
        headline4: AppFont.mediumWhite,
        headline5: AppFont.mediumCyanSky,
        bodyText2: AppFont.mediumColorRed,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  ///[darkThemeData] This method use to ThemeData of dark Theme Data
  ThemeData darkThemeData(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.colorPrimary,
      backgroundColor: AppColors.colorWhite,
      canvasColor: AppColors.colorGrey,
      cardColor: AppColors.colorBlack,
      hintColor: AppColors.colorPhilippineGray,
      dialogBackgroundColor: AppColors.colorAntiFlashWhite, //f2f2f2
      dividerColor: AppColors.colorAntiFlashWhiteBorder,
      shadowColor: AppColors.colorCultured, //f0f0f0
      primaryTextTheme: TextTheme(
        headline1: AppFont.mediumPhilippineGray,
        headline2: AppFont.mediumDarkCharcoal,
        headline3: AppFont.mediumBlack,
        headline4: AppFont.mediumWhite,
        headline5: AppFont.mediumCyanSky,
        bodyText2: AppFont.mediumColorRed,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  /// Used by [SystemChrome] of app
  void addingMobileUiStyles(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: (Theme.of(context).brightness == Brightness.dark)
            ? Colors.transparent
            : AppColors.colorWhite,
        /* set Status bar color in Android devices. */

        statusBarIconBrightness: Brightness.dark,
        /* set Status bar icons color in Android devices.*/
        statusBarBrightness: Brightness.dark));
  }

  ///[setTimer] This method use to set Timer
  void setTimer() {
    Timer(const Duration(milliseconds: 200), () async {
      isDrawerClose.value = false;
    });
  }

  Future<void> updateLanguage() async {
    if (PreferenceHelper.getString(PreferenceHelper.userLanguage) != null &&
        PreferenceHelper.getString(PreferenceHelper.userLanguage)!.isNotEmpty) {
      MaterialAppWidget.notifier.value =
          PreferenceHelper.getString(PreferenceHelper.userLanguage) ==
                  APPStrings.languageEn
              ? const Locale(PreferenceHelper.userLanguage)
              : const Locale(APPStrings.languageAr);
    }
  }
}
