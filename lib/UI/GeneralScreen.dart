import 'package:flutter/material.dart';
import 'package:news_app/UI/drawerHome.dart';
import 'package:news_app/UI/getResourcesUI.dart';
import 'package:news_app/UI/homeScreen.dart';
import 'package:news_app/UI/searchUI.dart';
import 'package:news_app/cubit/newsViewModel.dart';
import 'package:news_app/di.dart';
import 'package:news_app/model/generalModel.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/appStyles.dart';

class Generalscreen extends StatefulWidget {
  static String GeneralscreenRoute = "GeneralscreenRoute";

  @override
  State<Generalscreen> createState() => _GeneralscreenState();
}

class _GeneralscreenState extends State<Generalscreen> {
  Newsviewmodel veiwModle =
      Newsviewmodel(newsRemoteRepository: injectNewsRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedGeneralModel == null ? "Home" : selectedGeneralModel!.title,
          style: Appstyles.black20,
        ),
        actions: [
          InkWell(
            child: Icon(
              Icons.search,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context , Searchui.SearchuiRoute);
              setState(() {});
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Drawerhome(
          fromDrowerToHomeScreen: fromDrowerToHomeScreen,
        ),
      ),
      body: selectedGeneralModel == null
          ? Homescreen(
              setSelctedGeneralmodel: setSelctedGeneralmodel,
            )
          : Getresourcesui(
              generalmodel: selectedGeneralModel!,
            ),
    );
  }

  Generalmodel? selectedGeneralModel;

  void setSelctedGeneralmodel(Generalmodel generalmodel) {
    selectedGeneralModel = generalmodel;
    setState(() {});
  }

  void fromDrowerToHomeScreen() {
    selectedGeneralModel = null;
    Navigator.pop(context);
    setState(() {});
  }
}
