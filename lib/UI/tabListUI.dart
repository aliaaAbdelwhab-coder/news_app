import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/getNewsUI.dart';
import 'package:news_app/cubit/catigoryViewModel.dart';
import 'package:news_app/cubit/newsViewModel.dart';
import 'package:news_app/cubit/states/newsSates.dart';
import 'package:news_app/cubit/states/states.dart';
import 'package:news_app/di.dart';
import 'package:news_app/model/source_responce.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/appStyles.dart';

class Tablistui extends StatefulWidget {
  // AsyncSnapshot<SourceResponce?> snapshot;
  List<Sources> sourcesList = [];

  Tablistui(
      {
      // required this.snapshot,
      // required this.selectedIndex,
      required this.sourcesList});
  Sources? selectedIndexsources;
  @override
  State<Tablistui> createState() => _TablistuiState();
}

class _TablistuiState extends State<Tablistui> {
  Newsviewmodel viewModel =
      Newsviewmodel(newsRemoteRepository: injectNewsRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSelectedIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) {
        return viewModel;
      },
      child: BlocBuilder<Newsviewmodel, Newssates>(
        builder: (context, state) {
          // viewModel.sourcesList = widget.sourcesList;

          return DefaultTabController(
            length: widget.sourcesList.length,
            child: Column(
              children: [
                Container(
                  // height: size.height*0.1,
                  child: TabBar(
                      indicatorColor: Appcolors.blackColor,
                      dividerColor: Appcolors.whiteColor,
                      onTap: (index) {
                        // widget.selectedIndex = index;
                        if (state is changeSelectedIndexState) {
                    
                          viewModel.getSelectedIndex(index);
                          widget.selectedIndexsources =
                              widget.sourcesList[index];
                    
                        }

                        // setState(() {});
                        // print("${widget.selectedIndex} ======================================================================================");
                        // print("${widget.sourcesList[widget.selectedIndex].name}");
                      },
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: widget.sourcesList.map((sources) {
                        return Text(
                          sources.name ?? " ",
                          style: viewModel.selectedIndex ==
                                  widget.sourcesList.indexOf(sources)
                              ? Appstyles.bold16black
                              : Appstyles.black14,
                        );
                      }).toList()),
                ),
                Expanded(
                    child: Getnewsui(
                        sources: widget.selectedIndexsources ??
                            widget.sourcesList[viewModel.selectedIndex]))
              ],
            ),
          );
        },
        // child: DefaultTabController(
        // length: widget.sourcesList.length,
        // child: Column(
        //   children: [
        //     Container(
        //       // height: size.height*0.1,
        //       child: TabBar(
        //           indicatorColor: Appcolors.blackColor,
        //           dividerColor: Appcolors.whiteColor,
        //           onTap: (index) {
        //             // widget.selectedIndex = index;
        //             viewModel.getSelectedIndex(index);

        //             // setState(() {});
        //             // print("${widget.selectedIndex} ======================================================================================");
        //             // print("${widget.sourcesList[widget.selectedIndex].name}");
        //           },
        //           tabAlignment: TabAlignment.start,
        //           isScrollable: true,
        //           tabs: widget.sourcesList.map((sources) {
        //             return Text(
        //               sources.name ?? " ",
        //               style: viewModel.selectedIndex ==
        //                       widget.sourcesList.indexOf(sources)
        //                   ? Appstyles.bold16black
        //                   : Appstyles.black14,
        //             );
        //           }).toList()),
        //     ),
        //     Expanded(
        //         child: Getnewsui(
        //             sources: widget.sourcesList[viewModel.selectedIndex])
        //             )
        //   ],
        // ),
        // ),
      ),
    );
  }

  // int setandgetSelectedIndex(selectedIndex) {
  //   return selectedIndex;
  // }
}
