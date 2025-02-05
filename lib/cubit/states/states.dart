import 'package:news_app/model/source_responce.dart';

abstract class CatigoryStates {}

class LoadingStates extends CatigoryStates {}

class ErrorStates extends CatigoryStates {
  String errorMessage;
  ErrorStates({required this.errorMessage});
}

class SucsessStates extends CatigoryStates {
  List<Sources> sourceList;
  SucsessStates({required this.sourceList});
}

