import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/apiConstants.dart';
import 'package:news_app/model/news_responce.dart';
import 'package:news_app/model/source_responce.dart';

class Apimanager {
  Future<SourceResponce?> getSources(String id) async {
    Uri url = Uri.https(Apiconstants.serverName, Apiconstants.apiName,
        {"apiKey": Apiconstants.apiKey ,
         "category":id,
        });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponce.fromJson(json);
    } on Exception catch (e) {
      throw e;
    }
  }
  Future<NewsResponce?> getNews(String sourceId) async {
    Uri url = Uri.https(Apiconstants.serverName, Apiconstants.apiNewsName,
        {"apiKey": Apiconstants.apiKey,
          "sources": sourceId
        });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponce.fromJson(json);
    } on Exception catch (e) {
      throw e;
    }
  } 

    Future<NewsResponce?> getSeachNews( String seachText) async {
    Uri url = Uri.https(Apiconstants.serverName, Apiconstants.apiNewsName,
        {"apiKey": Apiconstants.apiKey,
          // "sources": sourceId,
          "q": seachText,
        });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponce.fromJson(json);
    } on Exception catch (e) {
      throw e;
    }
  } 
}
