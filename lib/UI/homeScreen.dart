import 'package:flutter/material.dart';
import 'package:news_app/model/generalModel.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/appStyles.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Homescreen extends StatelessWidget {
  List<Generalmodel> generalModelList = Generalmodel.getGeneralList();
  Function setSelctedGeneralmodel;
  
  Homescreen({required this.setSelctedGeneralmodel });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Appstyles.bold24black,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: index % 2 == 0
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: generalModelList[index].imagePath),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ToggleSwitch(
                        customWidths: [
                          size.width * 0.2,
                          size.width * 0.14,
                        ],
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [Appcolors.whiteColor!],
                          [Appcolors.whiteColor!],
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        customWidgets: [
                          Text(
                            "View All",
                            style: Appstyles.bold24black,
                          ),
                          CircleAvatar(
                            backgroundColor: Appcolors.whiteColor,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Appcolors.blackColor,
                            ),
                          )
                        ],
                        // labels: ['True', 'False'],
                        radiusStyle: true,
                        onToggle: (index1) {
                          setSelctedGeneralmodel(generalModelList[index]);
                        },
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: size.height * 0.02,
                );
              },
              itemCount: generalModelList.length,
            ),
          ),
        ],
      ),
    );
  }
}
