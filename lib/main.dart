import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'assests/text.dart';
import 'widgets/trending.dart';
import 'widgets/toprated.dart';
import 'widgets/tv.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.yellow, brightness: Brightness.dark),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = '83707215fea0eba9a17b5f8a80d7b7b6';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MzcwNzIxNWZlYTBlYmE5YTE3YjVmOGE4MGQ3YjdiNiIsInN1YiI6IjYxMjllNDlhODExNDBmMDA0MzI1ZWY1NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uZaSsCwKzJDiOTJrRG_ssZRRWwo2B359DvgbpRt6ug0';

  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
    print(trendingMovies);
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: main_text(
            text: 'tMDB',
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
          TV(tv: tv),
          TopRated(toprated:topRatedMovies),
        ],
      ),
    );
  }
}
