import 'package:news_app/model/source_responce.dart';
import 'package:news_app/repository/dataSource/source_remote.dart';
import 'package:news_app/repository/repository/source_remote_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemote sourceRemote;
  SourceRepositoryImpl({required this.sourceRemote});
  @override
  Future<SourceResponce?> getSources(String catigoryId) {
    return sourceRemote.getSources(catigoryId);
  }
}
