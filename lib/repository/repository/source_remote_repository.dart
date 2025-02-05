import 'package:news_app/model/source_responce.dart';

abstract class SourceRepository {
    Future<SourceResponce?> getSources(String catigoryId);
}