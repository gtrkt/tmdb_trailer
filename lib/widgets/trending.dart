import 'package:flutter/material.dart';
import 'package:tmdb_trailer/assests/text.dart';
import 'package:tmdb_trailer/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          main_text(
            text: 'Featured Today',
            size: 22,
            color: Colors.yellow,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: const Color(0xFF131313),
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trending[index]['title'],
                          bannerurl: 'http://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          posterurl: 'http://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          description: trending[index]['overview'],
                          vote: trending[index]['vote_average'].toString(),
                          launch_on: trending[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            height: 154,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500' +
                                        trending[index]['backdrop_path']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: main_text(
                              text: trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'Loading',
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
