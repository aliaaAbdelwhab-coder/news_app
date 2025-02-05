
import 'package:news_app/News%20repository/dataSource/news_remote-dataSource-impl.dart';
import 'package:news_app/News%20repository/dataSource/news_remote-dataSource.dart';
import 'package:news_app/News%20repository/repository/News_repository.dart';
import 'package:news_app/News%20repository/repository/News_repositoryimpl.dart';
import 'package:news_app/api/apiManager.dart';
import 'package:news_app/repository/dataSource/source_remote.dart';
import 'package:news_app/repository/dataSource/source_remote_impl.dart';
import 'package:news_app/repository/repository/source_remote_repository.dart';
import 'package:news_app/repository/repository/sourcerepository_impl.dart';


SourceRepository injectSourceRepository() {
  return SourceRepositoryImpl(
      sourceRemote: injectSourceRemoteDataSource());
}

SourceRemote injectSourceRemoteDataSource() {
  return SourceRemoteImpl(apimanager: injectApiManager());
}

Apimanager injectApiManager() {
  return Apimanager();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryimpl(newsRemoteDatasource: injectNewsRemoteDataSource());
}

NewsRemoteDatasource injectNewsRemoteDataSource() {
  return NewsRemotedatasourceimpl(apimanager: injectApiManager());
}


