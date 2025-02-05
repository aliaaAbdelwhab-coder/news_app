import 'package:news_app/model/source_responce.dart';

abstract class SourceRemote {
  Future<SourceResponce?> getSources(String catigoryId);
}
