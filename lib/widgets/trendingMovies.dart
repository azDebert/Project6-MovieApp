import 'package:flutter/material.dart';
import 'package:movieapp_adebert/moviedescription.dart';
import 'package:movieapp_adebert/utility/modifyFont.dart';

class widgetTrendingMovies extends StatelessWidget {
  final List trendingMovies;

  const widgetTrendingMovies({Key? key, required this.trendingMovies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //This will align the text to the left.
          children: [
            MainFont(
              text: 'Trending Movies',
              size: 25,
            ),
            SizedBox(
              height: 15,
            ), //This SizedBox will create the distance between the Title text and the movies.
            Container(
                height: 270,
                child: ListView.builder(
                    itemCount: trendingMovies.length,
                    scrollDirection: Axis
                        .horizontal, //This will make the movies scroll horizontally.
                    itemBuilder: ((context, index) {
                      return InkWell(
                          //This will make the movie clickable. After pressing it, it will navigate to the movie description page.
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Description(
                                          title: trendingMovies[index]['title'],
                                          bannerImage:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trendingMovies[index]
                                                      ['backdrop_path'],
                                          posterImage:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trendingMovies[index]
                                                      ['poster_path'],
                                          description: trendingMovies[index]
                                              ['overview'],
                                          voteCount: trendingMovies[index]
                                                  ['vote_average']
                                              .toString(),
                                        )));
                          },
                          child: Container(
                            width: 150,
                            margin: EdgeInsets.only(
                                right:
                                    10), //This will create the distance between the movies.
                            child: Column(
                              children: [
                                Container(
                                  width: 250,
                                  height: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              //This will get the image from the API.
                                              'https://image.tmdb.org/t/p/w500${trendingMovies[index]['backdrop_path']}'),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  height: 10,
                                ), //This will create the distance between the movie poster and the movie title.
                                Container(
                                  width: 150,
                                  child: MainFont(
                                    text: trendingMovies[index]['title'] != null
                                        ? trendingMovies[index]['title']
                                        : trendingMovies[index]['name'],
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ));
                    })))
          ],
        ));
  }
}
