import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/GeneralScreen.dart';
import 'package:news_app/UI/NewsItemUI.dart';
import 'package:news_app/cubit/newsViewModel.dart';
import 'package:news_app/cubit/searchViewModle.dart';
import 'package:news_app/cubit/states/newsSates.dart';
import 'package:news_app/di.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/appStyles.dart';

class Searchui extends StatefulWidget {
  @override
  State<Searchui> createState() => _SearchuiState();
  static String SearchuiRoute = "SearchuiRoute";
}

class _SearchuiState extends State<Searchui> {
  // Newsviewmodel veiwModle =
  //     Newsviewmodel(newsRemoteRepository: injectNewsRepository());
  Searchviewmodle veiwModle =
      Searchviewmodle(newsRemoteRepository: injectNewsRepository());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
              onChanged: (text) {
                veiwModle.searchContrller.text = text;
                veiwModle.getSearchNews();
              },
              // controller: veiwModle.searchContrller,
              cursorColor: Appcolors.blackColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Appcolors.blackColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Appcolors.blackColor,
                    width: 2,
                  ),
                ),
                suffixIcon: InkWell(
                  child: Icon(Icons.close),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, Generalscreen.GeneralscreenRoute);
                    // setState(() {});
                  },
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "search",
                hintStyle: Appstyles.black14,
              ))),
      body: BlocProvider(
        create: (context) => veiwModle,
        child:
            BlocBuilder<Searchviewmodle, Newssates>(builder: (context, state) {
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
                      // viewModel.getNews(widget.sources.id!);
                    },
                    child: Text("try again"))
              ],
            );
          } else if (state is NewsSucsessgState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Newsitemui(
                  articles: state.NewsList[index],
                );
              },
              itemCount: state.NewsList.length,
            );
          } else if (state is changeSelectedIndexState) {
            print(
                "this is changeSelectedIndexState ================================");
            // viewModel.getNews(widget.sources.id!);
          }
          return Container(
            child: Text("Write in shearc fild "),
          );
        }),
      ),
    );
  }
}
