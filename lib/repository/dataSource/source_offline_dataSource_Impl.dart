import 'package:hive/hive.dart';
import 'package:news_app/model/source_responce.dart';
import 'package:news_app/repository/dataSource/source_offline_dataSource.dart';

class SourceOfflineDatasourceImpl implements SourceOfflineDatasource {
  @override
  Future<SourceResponce?> getSavedSources(String catigoryId) async {
    // TODO: implement getSavedSources
    var box = await Hive.openBox("sourceTab");
    var sourceResponse = await SourceResponce.fromJson(box.get(catigoryId));
    print("${sourceResponse.sources!.first.name}===========================================");
    return sourceResponse;
  }

  @override
  void saveSources(SourceResponce? sourceResponce, String catigoryId) async {
    // TODO: implement saveSources
    var box = await Hive.openBox("sourceTab");
    await box.put(catigoryId, sourceResponce?.toJson());
    await box.close();
  }
}
