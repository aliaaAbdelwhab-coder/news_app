import 'package:flutter/material.dart';
import 'package:news_app/api/apiManager.dart';
import 'package:news_app/model/news_responce.dart';
import 'package:news_app/model/source_responce.dart';

class ViewModleCatigoryDitails extends ChangeNotifier {
  List<Sources>? sourcesList;
  List <Articles>? newsList ;
  String? errormessage;
  // void getSources(String categoryId) async {
  //   sourcesList = null;
  //   errormessage = null;
  //   notifyListeners();
  //   try {
  //     var response = await Apimanager.getSources(categoryId);
  //     if (response?.status == "error") {
  //       errormessage = response!.message;
  //     } else {
  //       sourcesList = response!.sources;
  //     }
  //   } catch (e) {
  //     errormessage = "error load sources list";
  //   }
  //   notifyListeners();
  // }
  //   void getNews(String categoryId) async {
  //   newsList = null;
  //   newsList = null;
  //   notifyListeners();
  //   try {
  //     var response = await Apimanager.getNews(categoryId);
  //     if (response?.status == "error") {
  //       errormessage = response!.message;
  //     } else {
  //       newsList = response!.articles;
  //     }
  //   } catch (e) {
  //     errormessage = "error load sources list";
  //   }
  //   notifyListeners();
  // }

}
