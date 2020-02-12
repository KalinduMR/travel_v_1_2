import 'package:flutter/material.dart';

class MyColors {
  static Color darkBlue = Color(0xff2446a6),
      lightBlue = Color(0xff3a5fc8),
      lighterBlue = Color(0xff4169d8),
      red = Color(0xfffa9d85);
}

class User {
  static String fullname = "Cybdom Tech",
      profilePicture =
          "https://cdn.pixabay.com/photo/2019/11/19/21/44/animal-4638598_960_720.jpg";
}

class DestinationModel {
  final String placeName, imageUrl, date, hotelName, details;
  DestinationModel({this.placeName, this.imageUrl, this.date, this.hotelName,this.details});
}

final List<DestinationModel> destinationsList = [
  DestinationModel(
    date: "22 Nov, 2019",
    hotelName: "Hikkaduwa",
    imageUrl: "https://www.absolutesrilanka.asia/files/destination/30/gallery/aa8b65f7369c.jpg",
    placeName: "Galle",
    details: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
  ),
  DestinationModel(
    date: "22 Nov, 2019",
    hotelName: "Star Fort",
    imageUrl: "https://gotravellanka.com/wp-content/uploads/2019/09/Star-fort.jpg",
    placeName: "Matara",
      details: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."

  ),
  DestinationModel(
    date: "28 Nov, 2019",
    hotelName: "Temple of The Tooth",
    imageUrl: "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/73/d3/90.jpg",
    placeName: "Kandy",
      details: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."

  ),
];
