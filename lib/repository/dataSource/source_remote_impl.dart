import 'package:news_app/api/apiManager.dart';
import 'package:news_app/model/source_responce.dart';
import 'package:news_app/repository/dataSource/source_remote.dart';

class SourceRemoteImpl implements SourceRemote {
  Apimanager apimanager;
  SourceRemoteImpl({required this.apimanager});
  @override
  Future<SourceResponce?> getSources(String catigoryId) {
    return apimanager.getSources(catigoryId);
  }
}
