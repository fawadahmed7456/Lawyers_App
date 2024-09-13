import 'package:cases_app/features/bottom_nav_bar/bottomnavbar_provider.dart';
import 'package:cases_app/features/cases/cases_provider.dart';
import 'package:cases_app/features/home/home_provider.dart';
import 'package:cases_app/features/language/language_provider.dart';
import 'package:cases_app/features/login/login_provider.dart';
import 'package:cases_app/features/payment_method/payment_provider.dart';
import 'package:cases_app/features/signup/signup_provider.dart';
import 'package:cases_app/features/splash/splash_provider.dart';
import 'package:cases_app/features/splash/splash_view.dart';
import 'package:cases_app/features/submit_case/submit_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final String languageCode = prefs.getString('language_code') ?? '';
  runApp(MyApp(locale: languageCode));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AppLanguage()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => SubmitCaseProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => CasesProvider()),
      ],
      child: Consumer(
        builder: (context, AppLanguage languageProvider, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          locale: locale == ''
              ? const Locale('en')
              : languageProvider.appLocal == null
                  ? Locale(locale)
                  : Provider.of<AppLanguage>(context).appLocal,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashView(),
        ),
      ),
    );
  }
}
