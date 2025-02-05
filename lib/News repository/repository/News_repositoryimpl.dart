import 'package:news_app/News%20repository/dataSource/news_remote-dataSource.dart';
import 'package:news_app/News%20repository/repository/News_repository.dart';
import 'package:news_app/model/news_responce.dart';

class NewsRepositoryimpl implements NewsRepository {
  NewsRemoteDatasource newsRemoteDatasource;
  NewsRepositoryimpl({required this.newsRemoteDatasource});
  @override
  Future<NewsResponce?> getNews(String catigoryId) {
    return newsRemoteDatasource.getNews(catigoryId);
  }

  @override
  Future<NewsResponce?> getSeachNews(String searchText) {
    return newsRemoteDatasource.getSeachNews(searchText);
  }
}
