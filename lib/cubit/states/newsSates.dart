import 'package:news_app/model/news_responce.dart';

abstract class Newssates {}

class NewsLoadingState extends Newssates {}

class NewsErrorgState extends Newssates {
  String errorMessage;
  NewsErrorgState({required this.errorMessage});
}

class NewsSucsessgState extends Newssates {
  List<Articles> NewsList;
  NewsSucsessgState({required this.NewsList});
}

class changeSelectedIndexState extends Newssates {
   
}
