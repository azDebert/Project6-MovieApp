import 'package:flutter/material.dart';
import 'package:movieapp_adebert/utility/modifyFont.dart';
import 'package:movieapp_adebert/widgets/onTV.dart';
import 'package:movieapp_adebert/widgets/topRatedMovies.dart';
import 'package:movieapp_adebert/widgets/trendingMovies.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:shared_preferences/shared_preferences.dart'; //This will allow you to save data to the device.

void main() => runApp(MyApp());

//The code below will create a simple dark theme for your app.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color.fromARGB(255, 0, 85, 160)),
    );
  }
}

//The code below is able to be used to create the app bar for the application.
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path =
        Path(); //This will create a small curve at the bottom of the app bar.
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Below you can find the lists of movies and shows as well as the API keys needed to access the TMDB API.
class _HomeState extends State<Home> {
  List TrendingMovies = [];
  List TopRatedMovies = [];
  List OnTV = [];

//The code below will allow you to access the TMDB API.
  final String APIKey = 'ReplaceThisWithYourOwnAPIKey';
  final String ReadAccessToken =
      'ReplaceThisWithYourOwnReadAccessToken';

  void initState() {
    super.initState();
    loadMovies();
  }

//The code below are logs and maps that will then produce results.
  loadMovies() async {
    TMDB TMDBCustomLogs = TMDB(ApiKeys(APIKey, ReadAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingMovies = await TMDBCustomLogs.v3.trending
        .getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week);
    Map topRatedMovies = await TMDBCustomLogs.v3.movies.getTopRated();
    Map onTV = await TMDBCustomLogs.v3.tv.getAiringToday();

    setState(() {
      TrendingMovies = trendingMovies['results'];
      TopRatedMovies = topRatedMovies['results'];
      OnTV = onTV['results'];
    });
  }

//The code below will create the body of the application, design the app bar and create the widgets for the movies and shows.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: ClipPath(
            clipper: MyClipper(),
            child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 46, 68, 197),
                child: Center(
                  child: MainFont(text: 'Movie App', size: 40),
                )),
          ),
        ),
        body: ListView(
          //This will allow you to scroll through the movies and shows.
          children: [
            widgetTrendingMovies(trendingMovies: TrendingMovies),
            widgetTopRatedMovies(topRatedMovies: TopRatedMovies),
            widgetOnTV(onTV: OnTV),
          ],
        ));
  }
}
