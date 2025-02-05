import 'package:news_app/News%20repository/dataSource/news_remote-dataSource.dart';
import 'package:news_app/api/apiManager.dart';
import 'package:news_app/model/news_responce.dart';

class NewsRemotedatasourceimpl implements NewsRemoteDatasource {
  Apimanager apimanager;
  NewsRemotedatasourceimpl({required this.apimanager});
  @override
  Future<NewsResponce?> getNews(String catigoryId) {
    return apimanager.getNews(catigoryId);
  }

  @override
  Future<NewsResponce?> getSeachNews(String searchText) {
    return apimanager.getSeachNews(searchText);
  }
}
