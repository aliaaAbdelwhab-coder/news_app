import 'package:news_app/model/source_responce.dart';

abstract class SourceOfflineDatasource {
  Future<SourceResponce?> getSavedSources(String catigoryId);
  void saveSources(SourceResponce? sourceResponce ,String catigoryId );
}
