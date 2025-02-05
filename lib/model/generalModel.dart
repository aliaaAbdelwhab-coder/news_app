import 'package:flutter/material.dart';
import 'package:news_app/utils/appImages.dart';

class Generalmodel {
  String id;
  String title;
  Image imagePath;
  bool isdark;
  Generalmodel(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.isdark});

  static List<Generalmodel> getGeneralList() {
    return [
      Generalmodel(
        id:"general" ,
        title: "general", 
        imagePath: Appimages.generalLight, 
        isdark: false
        ),
      Generalmodel(
        id:"business" ,
        title: "business", 
        imagePath: Appimages.businessLight, 
        isdark: false),    
      Generalmodel(
        id:"sports" ,
        title: "sports", 
        imagePath: Appimages.sportsLight, 
        isdark: false), 
      Generalmodel(
        id:"technology" ,
        title: "technology", 
        imagePath: Appimages.technologyLight, 
        isdark: false), 
      Generalmodel(
        id:"entertainment" ,
        title: "entertainment", 
        imagePath: Appimages.entertainmentLight, 
        isdark: false),  
      Generalmodel(
        id:"health" ,
        title: "health", 
        imagePath: Appimages.healthLight, 
        isdark: false),   
      Generalmodel(
        id:"science" ,
        title: "science", 
        imagePath: Appimages.scienceLight, 
        isdark: false),                                          
    ];
  }
}
