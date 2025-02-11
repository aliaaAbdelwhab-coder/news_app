import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/News%20repository/dataSource/news_remote-dataSource-impl.dart';
import 'package:news_app/News%20repository/dataSource/news_remote-dataSource.dart';
import 'package:news_app/News%20repository/repository/News_repository.dart';
import 'package:news_app/News%20repository/repository/News_repositoryimpl.dart';
import 'package:news_app/api/apiManager.dart';
import 'package:news_app/cubit/states/newsSates.dart';
import 'package:news_app/cubit/states/states.dart';
import 'package:news_app/model/source_responce.dart';

class Searchviewmodle extends Cubit<Newssates> {
  int selectedIndex = 0;
  NewsRepository newsRemoteRepository;
  TextEditingController searchContrller = TextEditingController();

  Searchviewmodle({required this.newsRemoteRepository})
      : super(initState());

  void getNews(String sourceId) async {
    emit(NewsLoadingState());
    // var response = await Apimanager.getNews(sourceId);
    var response = await newsRemoteRepository.getNews(sourceId);
    try {
      if (response?.status == "error") {
        emit(NewsErrorgState(errorMessage: response!.message!));
      } else if (response?.status == "ok") {
        emit(NewsSucsessgState(NewsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorgState(errorMessage: "$e"));
    }
  }

  getSelectedIndex(int selectedIndex) {
    this.selectedIndex = selectedIndex;
    emit(changeSelectedIndexState());
  }

  void getSearchNews() async {
    emit(NewsLoadingState());
    var response = await newsRemoteRepository.getSeachNews(searchContrller.text);
    try {
      if (response?.status == "error") {
        emit(NewsErrorgState(errorMessage: response!.message!));
      } else if (response?.status == "ok") {
        emit(NewsSucsessgState(NewsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorgState(errorMessage: "$e"));
    }
  }
}
