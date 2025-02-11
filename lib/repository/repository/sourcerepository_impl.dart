import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/model/source_responce.dart';
import 'package:news_app/repository/dataSource/source_offline_dataSource.dart';
import 'package:news_app/repository/dataSource/source_remote.dart';
import 'package:news_app/repository/repository/source_remote_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemote sourceRemote;
  SourceOfflineDatasource sourceOfflineDatasource;
  SourceRepositoryImpl(
      {required this.sourceRemote, required this.sourceOfflineDatasource});
  @override
  Future<SourceResponce?> getSources(String catigoryId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var sourceReponce = await sourceRemote.getSources(catigoryId);

      sourceOfflineDatasource.saveSources(sourceReponce, catigoryId);
      return sourceReponce;
    } else {
      print("==================================no internet");
      var sourceReponce =
          await sourceOfflineDatasource.getSavedSources(catigoryId);
      return sourceReponce;
    }
  }
}
