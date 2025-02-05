import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/apiManager.dart';
import 'package:news_app/cubit/states/states.dart';
import 'package:news_app/model/source_responce.dart';
import 'package:news_app/repository/dataSource/source_remote.dart';
import 'package:news_app/repository/dataSource/source_remote_impl.dart';
import 'package:news_app/repository/repository/source_remote_repository.dart';
import 'package:news_app/repository/repository/sourcerepository_impl.dart';

class Catigoryviewmodel extends Cubit<CatigoryStates> {
  SourceRepository sourceRemoteRepository;

  // List<Sources> sourcesList = [];
  // late SourceRemote sourceRemoteDatasource;
  // late Apimanager apimanager;
  Catigoryviewmodel({required this.sourceRemoteRepository})
      : super(LoadingStates());
  // {
  // apimanager = Apimanager();
  // sourceRemoteDatasource = SourceRemoteImpl(apimanager: apimanager);
  // sourceRemoteRepository =
  //     SourceRemoteRepositoryImpl(sourceRemote: sourceRemoteDatasource);
  // }

  void getSources(String catigoryID) async {
    emit(LoadingStates());
    try {
      // var responce = await Apimanager.getSources(catigoryID);
      var responce = await sourceRemoteRepository.getSources(catigoryID);
      if (responce?.status == "error") {
        emit(ErrorStates(errorMessage: responce!.message!));
      }
      if (responce?.status == "ok") {
        emit(SucsessStates(sourceList: responce!.sources!));
      }
    } catch (e) {
      emit(ErrorStates(errorMessage: "$e"));
    }
  }

}
