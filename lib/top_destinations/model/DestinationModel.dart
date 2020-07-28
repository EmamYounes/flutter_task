import 'package:flutter_task/model/ActivityModel.dart';

class DestinationModel {
  String imageUrl;
  String city;
  String country;
  String description;
  List<ActivityModel> activities;

  DestinationModel({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<ActivityModel> activities = [
  ActivityModel(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  ActivityModel(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  ActivityModel(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];
