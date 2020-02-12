import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_v_1_2/details.dart';
import 'package:travel_v_1_2/global.dart';
import 'package:travel_v_1_2/data/post_data.dart';
import 'package:travel_v_1_2/widgets/post_item.dart';
import 'package:travel_v_1_2/my_flutter_app_icons.dart';
import 'my_flutter_app_icons.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 1;

  FirstRoute one;
  SecondRoute two;
  ThirdRoute thre;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    super.initState();

    one = FirstRoute();
    two = SecondRoute();
    thre = ThirdRoute();

    pages = [one, two, thre];

    currentPage = two;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff9f9f9),
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
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click search');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 28,
            ),
            onPressed: () {
              print('Click start');
            },
          ),
        ],
      ),
      backgroundColor: Color(0xfff9f9f9),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.beenhere, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.star, size: 30, color: Colors.white),
        ],
        index: currentTab,
        onTap: (int index) {
          //Handle button tap
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
      ),
      body: currentPage,
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
        onPressed: () {},
      ),
    );
  }
}

List imgList = [
  'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
];

class SecondRoute extends StatelessWidget {
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: new EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: new EdgeInsets.only(bottom: 10),
              child: Text('Recommended',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            CarouselSlider(
              height: 250.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //         <--- border radius here
                            ),
                        color: Colors.grey,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: new EdgeInsets.only(top: 15, bottom: 10),
              child: Text('Popular Places',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinationsList.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
              onTap: () => Navigator.push(
                              context,
                          MaterialPageRoute(
                      builder: (ctx) => DetailsScreen(id: i),
    ),
                         ),
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Image.network(
                                  destinationsList[i].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("${destinationsList[i].hotelName}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text(
                                        "${destinationsList[i].placeName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle
                                            .apply(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: new EdgeInsets.only(top: 15, bottom: 10),
              child: Text('Places Near You',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinationsList.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
//              onTap: () => Navigator.push(
//                              context,
//                          MaterialPageRoute(
//                      builder: (ctx) => DetailsScreen(id: i),
//    ),
                      //   ),
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Image.network(
                                  destinationsList[i].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("${destinationsList[i].placeName}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text(
                                        "${destinationsList[i].placeName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle
                                            .apply(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: new EdgeInsets.only(top: 15, bottom: 10),
              child: Text('Find by District',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    // new // solution for list scrolling issue
                    shrinkWrap: true,
                    controller: _controller,
                    children: ListTile.divideTiles(context: context, tiles: [
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('15 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Kandy'),
                        subtitle: Text('25 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Galle'),
                        subtitle: Text('10 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Matara'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Jaffna'),
                        subtitle: Text('15 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Colombo'),
                        subtitle: Text('5 Places'),
                        onTap: () {},
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ]).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          // Add your onPressed code here!
        },
          child: Image.asset('assets/scan.png',height: 80,width: 150,),
        backgroundColor: Colors.redAccent,
        elevation: 10,
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 10,
            spacing: 10,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Text(
                'OUR SERVICES',
                style: TextStyle(fontSize: 35),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              FlatButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: Image.asset('assets/hotels.png',height: 135,width: 80,)
//                child: Column(
//                  // Replace with a Row for horizontal icon + text
//                  children: <Widget>[
//                    Icon(
//                      Icons.local_taxi,
//                      size: 80,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                    Text("Transport\n")
//                  ],
//                ),
              ),
              FlatButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: Image.asset('assets/rest.png',height: 135,width: 80,)
//                child: Column(
//                  // Replace with a Row for horizontal icon + text
//                  children: <Widget>[
//                    Icon(
//                      Icons.local_taxi,
//                      size: 80,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                    Text("Transport\n")
//                  ],
//                ),
              ),
              FlatButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: Image.asset('assets/air.png',height: 135,width: 80,)
//                child: Column(
//                  // Replace with a Row for horizontal icon + text
//                  children: <Widget>[
//                    Icon(
//                      Icons.local_taxi,
//                      size: 80,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                    Text("Transport\n")
//                  ],
//                ),
              ),
              FlatButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: Image.asset('assets/guides.png',height: 135,width: 80,)
//                child: Column(
//                  // Replace with a Row for horizontal icon + text
//                  children: <Widget>[
//                    Icon(
//                      Icons.local_taxi,
//                      size: 80,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                    Text("Transport\n")
//                  ],
//                ),
              ),
              FlatButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: Image.asset('assets/taxi.png',height: 135,width: 80,)
//                child: Column(
//                  // Replace with a Row for horizontal icon + text
//                  children: <Widget>[
//                    Icon(
//                      Icons.local_taxi,
//                      size: 80,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                    Text("Transport\n")
//                  ],
//                ),
              ),
              FlatButton(
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  child: Image.asset('assets/tour_op1.png',height: 135,width: 80,)
//                child: Column(
//                  // Replace with a Row for horizontal icon + text
//                  children: <Widget>[
//                    Icon(
//                      Icons.local_taxi,
//                      size: 80,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                    Text("Transport\n")
//                  ],
//                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
