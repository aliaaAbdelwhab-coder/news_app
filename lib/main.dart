import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/UI/GeneralScreen.dart';
import 'package:news_app/UI/searchUI.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dirctory = await getApplicationDocumentsDirectory();
  Hive.init(dirctory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Homescreen(),
      initialRoute: Generalscreen.GeneralscreenRoute,
      routes: {
        Generalscreen.GeneralscreenRoute: (context) => Generalscreen(),
        Searchui.SearchuiRoute: (context) => Searchui(),
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
