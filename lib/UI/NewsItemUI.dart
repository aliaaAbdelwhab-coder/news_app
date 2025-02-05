// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_responce.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/appStyles.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:url_launcher/url_launcher.dart';

class Newsitemui extends StatefulWidget {
  Articles articles;

  Newsitemui({required this.articles});

  @override
  State<Newsitemui> createState() => _NewsitemuiState();
}

class _NewsitemuiState extends State<Newsitemui> {


  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(widget.articles.url!);

    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          // isScrollControlled :true ,
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                    vertical: size.height * 0.01),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: widget.articles.urlToImage ?? " ",
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: Appcolors.grayColor,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // Image.network(articles.urlToImage ?? " ")
                    ),
                    Text(
                      widget.articles.content ?? " ",
                      style: Appstyles.black14,
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                            minimumSize: WidgetStateProperty.all(
                                Size(double.infinity, size.height * 0.08)),
                            backgroundColor:
                                WidgetStateProperty.all(Appcolors.blackColor)),
                        onPressed: () async {
                          try {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                            setState(() {});
                          } catch (e) {
                            print("$e ===============this is url error===================");
                          }
                        },
                        child: Text(
                          "View Full Articel",
                          style: Appstyles.bold16white,
                        ))
                  ],
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01, horizontal: size.width * 0.02),
        margin: EdgeInsets.symmetric(
            vertical: size.height * 0.01, horizontal: size.width * 0.02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 3, color: Appcolors.blackColor)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: widget.articles.urlToImage ?? " ",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Appcolors.grayColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(articles.urlToImage ?? " ")
            ),
            Text(
              widget.articles.title ?? " ",
              style: Appstyles.bold16black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "by: ${widget.articles.author}",
                  style: Appstyles.gray12,
                )),
                Expanded(
                    child: Text(
                  timeago.format(
                          DateTime.parse(widget.articles.publishedAt ?? " ")) ??
                      " ",
                  style: Appstyles.gray12,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
