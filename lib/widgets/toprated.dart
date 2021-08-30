import 'package:flutter/material.dart';
import 'package:tmdb_trailer/assests/text.dart';
import 'package:tmdb_trailer/description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          main_text(
            text: 'tMDB\'s top rated',
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
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: toprated[index]['title'],
                          bannerurl: 'http://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          posterurl: 'http://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                          description: toprated[index]['overview'],
                          vote: toprated[index]['vote_average'].toString(),
                          launch_on: toprated[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      width: 120,
                      child: Column(
                        children: [
                          Container(
                            height:154,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(child:main_text(text:toprated[index]['title']!=null?
                          toprated[index]['title']:'Loading', size: 13,color: Colors.white,),),
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
