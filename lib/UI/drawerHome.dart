import 'package:flutter/material.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/appStyles.dart';

class Drawerhome extends StatelessWidget {
  Function fromDrowerToHomeScreen;
  Drawerhome({required this.fromDrowerToHomeScreen});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Appcolors.blackColor,
      child: Column(
        children: [
          Container(
            color: Appcolors.whiteColor,
            width: double.infinity,
            height: size.height * 0.3,
            child: Center(
                child: Text(
              "News App",
              style: Appstyles.bold24black,
            )),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03, horizontal: size.width * 0.03),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    fromDrowerToHomeScreen();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Appcolors.whiteColor,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        'Go To Home',
                        style: Appstyles.bold20white,
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: size.width * 0.03,
                  endIndent: size.width * 0.03,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.color_lens,
                      color: Appcolors.whiteColor,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      'Theme',
                      style: Appstyles.bold20white,
                    )
                  ],
                ),
                Divider(
                  indent: size.width * 0.03,
                  endIndent: size.width * 0.03,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Appcolors.whiteColor,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      'Language',
                      style: Appstyles.bold20white,
                    )
                  ],
                ),
                Divider(
                  indent: size.width * 0.03,
                  endIndent: size.width * 0.03,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
