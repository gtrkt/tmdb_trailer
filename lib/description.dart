import 'package:flutter/material.dart';
import 'assests/text.dart';
import 'service/video.dart';


class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);



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
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: main_text(
                        text: 'Average Rating - ' + vote,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: main_text(
                text: name != null ? name : 'Unavailable',
                size: 24,
                color: Colors.yellow,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Releases ' + launch_on,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      description,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SamplePlayer()));
            }, child: Text('▶ Watch Trailor'),),
          ],
        ),
      ),
    );
  }
}
