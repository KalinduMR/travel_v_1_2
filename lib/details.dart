import 'dart:math';

import 'package:flutter/material.dart';
import 'global.dart';
import 'package:travel_v_1_2/widgets/post_item.dart';
import 'package:travel_v_1_2/data/post_data.dart';

IconData icon = Icons.favorite_border;

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Column(
          children: <Widget>[
            new Text(
              "Travel Space",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            new Text("Explore Sri Lanka",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.left)
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print('Click search');
            },
          ),
          FlatButton(
              onPressed: () {
                icon = icon == Icons.favorite
                    ? Icons.favorite_border
                    : Icons.favorite;
                print('Click search');
              },
              child: new Icon(icon, size: 25.0)),
          IconButton(
            icon: Icon(
              Icons.bookmark_border,
              size: 28,
            ),
            onPressed: () {
              print('Click start');
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new ClipRRect(
              borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0)),
              child: Image.network(
                destinationsList[id].imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${destinationsList[id].hotelName}",
                    style: Theme.of(context).textTheme.display1.apply(
                          color: Colors.black,
                        ),
                  ),
                  FlatButton(
                    onPressed: () => {},
                    child: Row(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.location_on),
                        Text('${destinationsList[id].placeName}')
                      ],
                    ),
                  ),
                  Divider(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.favorite,color: Colors.grey,),
                        Text("555"),
                        Icon(Icons.remove_red_eye,color: Colors.grey,),
                        Text("245"),
                        Icon(Icons.star,color: Colors.grey,),
                        Text("4.6"),
                      ],
                    ),
                  ),
                  Divider(),
                  Text(
                    "About",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Text(
                    "${destinationsList[id].details}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Divider(),
                  Text(
                    "To Do",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 10,
                      spacing: 10,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () => {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                            child: Image.asset(
                              'assets/hotels.png',
                              height: 135,
                              width: 80,
                            )),
                        FlatButton(
                            onPressed: () => {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                            child: Image.asset(
                              'assets/rest.png',
                              height: 135,
                              width: 80,
                            )),
                        FlatButton(
                            onPressed: () => {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                            child: Image.asset(
                              'assets/air.png',
                              height: 135,
                              width: 80,
                            )),
                        FlatButton(
                            onPressed: () => {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                            child: Image.asset(
                              'assets/guides.png',
                              height: 135,
                              width: 80,
                            )),
                        FlatButton(
                            onPressed: () => {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                            child: Image.asset(
                              'assets/taxi.png',
                              height: 135,
                              width: 80,
                            )),
                        FlatButton(
                            onPressed: () => {},
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                            child: Image.asset(
                              'assets/tour_op1.png',
                              height: 135,
                              width: 80,
                            )),
                        Divider(),
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          itemCount: posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map post = posts[index];
                            return PostItem(
                              img: post['img'],
                              name: post['name'],
                              dp: post['dp'],
                              time: post['time'],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
