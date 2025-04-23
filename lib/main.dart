import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:rahatak_food_delivery_app/screen/screen.dart';
import 'package:rahatak_food_delivery_app/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rahatak Food Delivery App',
      builder: (context,child) {
        return Directionality(
          textDirection: Get.locale.toString() == "en" ?
          TextDirection.ltr :
          TextDirection.rtl,
          child: child!,
        );
      },
      locale: Locale("en"),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      translationsKeys: {
        "en": English().english,
        "ar": Arabic().arabic,
      },
      supportedLocales: [
        Locale("ar"),
        Locale("en"),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
