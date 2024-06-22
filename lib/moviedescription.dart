// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp_adebert/utility/modifyFont.dart';

class Description extends StatelessWidget {
  final String title;
  final String description;
  final String bannerImage;
  final String posterImage;
  final String voteCount;

  const Description({
    Key? key,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.posterImage,
    required this.voteCount,
  }) : super(key: key);

//This is the description page. It will show the title, description, banner image, poster image and the average rating.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                          //This will create the banner image on top of the description page.
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            bannerImage,
                            fit: BoxFit.cover,
                          ))),
                  Positioned(
                      bottom: 5,
                      left: 5,
                      child: MainFont(
                        text: 'Average Rating - ' + voteCount,
                        size: 20,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //This will create the title of the movie.
              padding: EdgeInsets.all(10),
              child: MainFont(
                text: title != null ? title : 'Not Loaded',
                size: 30,
              ),
            ),
            Row(
              children: [
                Container(
                    //This will create the poster image.
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      posterImage,
                      height: 200,
                    )),
                Flexible(
                    child: Container(
                        //This will create the description of the movie.
                        padding: EdgeInsets.all(10),
                        child: MainFont(
                          text: description,
                          size: 18,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
