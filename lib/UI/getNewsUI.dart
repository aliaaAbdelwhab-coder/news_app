import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/NewsItemUI.dart';
import 'package:news_app/cubit/newsViewModel.dart';
import 'package:news_app/cubit/states/newsSates.dart';
import 'package:news_app/di.dart';
import 'package:news_app/model/source_responce.dart';
import 'package:news_app/utils/appStyles.dart';


class Getnewsui extends StatefulWidget {
  Sources sources;
  Getnewsui({required this.sources});
  @override
  State<Getnewsui> createState() => _GetnewsuiState();
}

class _GetnewsuiState extends State<Getnewsui> {
  // List<Articles> newsList = [];
  // ViewModleCatigoryDitails viewmodle = ViewModleCatigoryDitails();
  Newsviewmodel viewModel =
      Newsviewmodel(newsRemoteRepository: injectNewsRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.sources.id!);
    print("this is initstate ==========================================");
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sources.id!);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<Newsviewmodel, Newssates>(builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsErrorgState) {
          return Column(
            children: [
              Text(
                state.errorMessage,
                style: Appstyles.black14,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNews(widget.sources.id!);
                    // setState(() {});
                  },
                  child: Text("try again"))
            ],
          );
        } else if (state is NewsSucsessgState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              // print("index in news ui $index ===================================================================");
              // return Text(
              //   newsList[index].title ?? " ",
              //   style: Appstyles.bold16black,
              // );
              return Newsitemui(
                articles: state.NewsList[index],
              );
            },
            itemCount: state.NewsList.length,
          );
        } else if (state is changeSelectedIndexState) {
          print(
              "this is changeSelectedIndexState ================================");
          viewModel.getNews(widget.sources.id!);
        }
        return Container();
      }),
    );
    //================================================================================
    //  ChangeNotifierProvider(
    //   create: (BuildContext context) => viewmodle,
    //   child: Consumer<ViewModleCatigoryDitails>(
    //     builder: (BuildContext context, viewmodle, Widget? child) {
    //       if (viewmodle.errormessage != null) {
    //         return Column(
    //           children: [
    //             Text(
    //               viewmodle.errormessage!,
    //               style: Appstyles.black14,
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   viewmodle.getNews(widget.sources.id!);
    //                   setState(() {});
    //                 },
    //                 child: Text("try again"))
    //           ],
    //         );
    //       }
    //       if (viewmodle.newsList == null) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else {
    //         return ListView.builder(
    //           itemBuilder: (context, index) {
    //             // return Text(
    //             //   newsList[index].title ?? " ",
    //             //   style: Appstyles.bold16black,
    //             // );
    //             return Newsitemui(
    //               articles: viewmodle.newsList![index],
    //             );
    //           },
    //           itemCount: viewmodle.newsList!.length,
    //         )
    //         ;
    // }
    // },
    //========================================================================================
    // future: Apimanager.getNews(widget.sources.id ?? " "),
    // builder: (context, snapshot) {
    //   if (snapshot.connectionState == ConnectionState.waiting) {
    //     // print("CircularProgressIndicator=========================");
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   } else if (snapshot.hasError) {
    //     return Column(
    //       children: [
    //         Text(
    //           "somthing went wrong ",
    //           style: Appstyles.black14,
    //         ),
    //         ElevatedButton(
    //             onPressed: () {
    //               Apimanager.getNews(widget.sources.id ?? " ");
    //               setState(() {});
    //             },
    //             child: Text("try again"))
    //       ],
    //     );
    //   } else if (snapshot.data!.status != "ok") {
    //     return Column(
    //       children: [
    //         Text(
    //           snapshot.data!.message ?? "error form api ",
    //           style: Appstyles.black14,
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Apimanager.getNews(widget.sources.id ?? " ");
    //             setState(() {});
    //           },
    //           child: Text("try again"),
    //         )
    //       ],
    //     );
    //   }
    //   newsList = snapshot.data!.articles!;
    //   return ListView.builder(
    //     itemBuilder: (context, index) {
    //       // return Text(
    //       //   newsList[index].title ?? " ",
    //       //   style: Appstyles.bold16black,
    //       // );
    //       return Newsitemui(
    //         articles: newsList[index],
    //       );
    //     },
    //     itemCount: newsList.length,
    //   );
    // }
    //   ),
    // );
  }

}
