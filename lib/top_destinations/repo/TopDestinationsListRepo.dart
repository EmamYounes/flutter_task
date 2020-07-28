import 'package:flutter_task/top_destinations/model/DestinationModel.dart';

class TopDestinationsListRepo {
  List<DestinationModel> getTopDestinationsList() {
    return destinations;
  }
}

List<DestinationModel> destinations = [
  DestinationModel(
    imageUrl: 'assets/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  DestinationModel(
    imageUrl: 'assets/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  DestinationModel(
    imageUrl: 'assets/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  DestinationModel(
    imageUrl: 'assets/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  DestinationModel(
    imageUrl: 'assets/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
