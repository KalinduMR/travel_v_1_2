import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class com1 {
  final int id;
  final String title;
  final String remark;

  com1({this.id, this.title, this.remark});

  factory com1.fromJson(Map<String, dynamic> json) {
    return com1(
      id: json['id'],
      title: json['name'],
      remark: json['username'],
    );
  }
}

class com extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<com1>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<com1> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<com1>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new com1.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].title, data[index].remark);
        });
  }

  ExpansionTile _tile(String title, String subtitle) => ExpansionTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
//    leading: Icon(
//      icon,
//      color: Colors.red[500],
//    ),
        trailing: Icon(Icons.arrow_forward),
//    children: <Widget>[
//      Text(remark,
//          style: TextStyle(
//            fontSize: 15,
//          )),
//      Text(status,
//          style: TextStyle(
//            fontSize: 15,
//          )),
//    ],
      );
}
