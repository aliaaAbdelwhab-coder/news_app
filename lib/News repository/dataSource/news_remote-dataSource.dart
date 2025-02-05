import 'package:news_app/model/news_responce.dart';

abstract class NewsRemoteDatasource {
  Future<NewsResponce?> getNews(String catigoryId);
  Future<NewsResponce?> getSeachNews(String searchText);
}
