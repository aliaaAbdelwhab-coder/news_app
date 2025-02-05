import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/tabListUI.dart';

import 'package:news_app/cubit/catigoryViewModel.dart';

import 'package:news_app/cubit/states/states.dart';
import 'package:news_app/di.dart';
import 'package:news_app/model/generalModel.dart';

import 'package:news_app/utils/appStyles.dart';


class Getresourcesui extends StatefulWidget {
  Generalmodel generalmodel;
  Getresourcesui({required this.generalmodel});

  @override
  State<Getresourcesui> createState() => _GetresourcesuiState();
}

class _GetresourcesuiState extends State<Getresourcesui> {
  // ViewModleCatigoryDitails viewmodle = ViewModleCatigoryDitails();
  Catigoryviewmodel viewmodel =
      Catigoryviewmodel(sourceRemoteRepository: injectSourceRepository());
  // int selectedIndex = 0;
  // List<Sources> sourcesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getSources(widget.generalmodel.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (contex) => viewmodel,
      child: BlocBuilder<Catigoryviewmodel, CatigoryStates>(
          builder: (context, state) {
        if (state is LoadingStates) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorStates) {
          return Column(
            children: [
              Text(
                state.errorMessage,
                style: Appstyles.black14,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewmodel.getSources(widget.generalmodel.id);
                    setState(() {});
                  },
                  child: Text("try again"))
            ],
          );
        } else if (state is SucsessStates) {
          // viewmodel.sourcesList = state.sourceList;
          return Tablistui(
              // snapshot: viewmodle!.sourcesList!.,
              // selectedIndex: selectedIndex,
              sourcesList: state.sourceList,
              );
        }
        return Container();
      }),
    );

    //==================================================================
    // ChangeNotifierProvider(
    //   create: (BuildContext context) {
    //     return viewmodle;
    //   },
    //   child: Consumer<ViewModleCatigoryDitails>(
    //       builder: (context, viewmodle, child) {
    //     if (viewmodle.errormessage != null) {
    //       return Column(
    //         children: [
    //           Text(
    //             viewmodle!.errormessage!,
    //             style: Appstyles.black14,
    //           ),
    //           ElevatedButton(
    //               onPressed: () {
    //                 viewmodle.getSources(widget.generalmodel.id);
    //                 setState(() {});
    //               },
    //               child: Text("try again"))
    //         ],
    //       );
    //     }
    //     if (viewmodle.sourcesList == null) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       return Tablistui(
    //         // snapshot: viewmodle!.sourcesList!.,
    //         selectedIndex: selectedIndex,
    //         sourcesList: viewmodle!.sourcesList!,
    //       );
    //     }
    //   }),
    //=========================================================================================
    // FutureBuilder<SourceResponce?>(
    //     future: Apimanager.getSources(widget.generalmodel.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text(
    //               "somthing went wrong ",
    //               style: Appstyles.black14,
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   Apimanager.getSources(widget.generalmodel.id);
    //                   setState(() {});
    //                 },
    //                 child: Text("try again"))
    //           ],
    //         );
    //       } else if (snapshot.data!.status != "ok") {
    //         return Column(
    //           children: [
    //             Text(
    //               snapshot.data!.message ?? "error form api ",
    //               style: Appstyles.black14,
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 Apimanager.getSources(widget.generalmodel.id);
    //                 setState(() {});
    //               },
    //               child: Text("try again"),
    //             )
    //           ],
    //         );
    //       }

    //       // return ListView.builder(
    //       //   itemBuilder: (BuildContext context, int index) {
    //       //     return Text(snapshot.data!.sources![index].name ?? " ");
    //       //   },
    //       //   itemCount: snapshot.data!.sources!.length,
    //       // );
    //       sourcesList = snapshot.data!.sources!;
    //       // print(snapshot.data!.sources!.length);
    //       return Tablistui(
    //         snapshot: snapshot,
    //         selectedIndex: selectedIndex,
    //         sourcesList: sourcesList,
    //       );
    //     }
    // ),
    // )
  }
}
