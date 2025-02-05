import 'package:news_app/model/news_responce.dart';
import 'package:news_app/model/source_responce.dart';

abstract class NewsRepository {
    Future<NewsResponce?> getNews(String catigoryId);
    Future<NewsResponce?> getSeachNews(String searchText);
}