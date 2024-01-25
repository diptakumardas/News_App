import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class NewsDetailsScreen extends StatefulWidget {
  final String newsImage, newsTitle, newsdate, author,description,content,source;
    const NewsDetailsScreen({super.key,
    required this.newsImage,
    required this.newsTitle,
    required this.newsdate,
    required this.source,
    required this.content,
    required this.description,
    required this.author,

    });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  final format = DateFormat('MMM dd, yyyy');
  Widget build(BuildContext context) {

    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    DateTime dateTime =  DateTime.parse(widget.newsdate);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            height: height * .45,
            child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft:  Radius.circular(30),topRight: Radius.circular(30)),
            child: CachedNetworkImage(imageUrl: widget.newsImage,fit: BoxFit.cover,placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),)),

          ),
          Container(

            height: height*.6,
            margin: EdgeInsets.only(top: height*.4),
            padding: EdgeInsets.only(top:20,left: 20,right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:  Radius.circular(30),topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: ListView(
              children: [
                Text(widget.newsTitle,style: GoogleFonts.poppins(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.w700),),
                SizedBox(
                  height: height*.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.source,style: GoogleFonts.poppins(fontSize: 13,color: Colors.black87,fontWeight: FontWeight.w600),),
                    Text(format.format(dateTime),style: GoogleFonts.poppins(fontSize: 13,color: Colors.black87,fontWeight: FontWeight.w600),),

                  ],
                ),
                SizedBox(
                  height: height*.03,
                ),
                Text(widget.description,style: GoogleFonts.poppins(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w600),),

              ],
            ),
          )
        ],
      ),

    );
  }
}
