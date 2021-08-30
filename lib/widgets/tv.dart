import 'package:flutter/material.dart';
import 'package:tmdb_trailer/assests/text.dart';
import 'package:tmdb_trailer/description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          main_text(
            text: 'Explore what\'s streaming',
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
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: tv[index]['original_name'],
                          bannerurl: 'http://image.tmdb.org/t/p/w500' +
                              tv[index]['backdrop_path'],
                          posterurl: 'http://image.tmdb.org/t/p/w500' +
                              tv[index]['poster_path'],
                          description: tv[index]['overview'],
                          vote: tv[index]['vote_average'].toString(),
                          launch_on: tv[index]['first_air_date'],
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
                                    'http://image.tmdb.org/t/p/w500'+tv[index]['poster_path']
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(child:main_text(text:tv[index]['original_name']!=null?
                          tv[index]['original_name']:'Loading', size: 13,color: Colors.white,),),
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
