import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/UI/GeneralScreen.dart';
import 'package:news_app/UI/homeScreen.dart';
import 'package:news_app/UI/searchUI.dart';


void main() async {
  runApp(
    MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Homescreen(),
      initialRoute: Generalscreen.GeneralscreenRoute,
      routes: {
       Generalscreen.GeneralscreenRoute:(context)=>Generalscreen(),
       Searchui.SearchuiRoute:(context)=>Searchui(),
      },
      // theme: Apptheme.lightTheme,
      // darkTheme: Apptheme.darkTheme,
      // themeMode: themeProvider.Apptheme,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      // locale: Locale(languageProvider.appLanguage),
    );
  }
}
